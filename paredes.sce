function  [q_cond_total,q_cond_pico,ang_incid]=parede(surf_azim,surf_incl,cts_wall_brick_sel,U,A,alpha)
//Constantes para calculo da temperatura Sol-ar
h0 = 17
emitanc = 0
DeltaR = 63 

q_cond_conv = 0.54 //Constante que define a parcela convectiva e radiativa usada para calculo do calor devido a conducao. Referencia Ashrae 18.23 Tab 14

//A partir desse ponto inicia o calculo especifico para superficies


surf_sol_azim(1,:) = phi-surf_azim

ang_incid = acosd(cosd(Beta).*cosd(surf_sol_azim)*sind(surf_incl) + sind(Beta)*cosd(surf_incl)) //Angulo de incidencia, é o angulo entre a superficie e os raios com incidencia direta, faz diferenca no calculo da radiacao direta
//Testado e Funcionando
//ang_incid gera um vetor com angulo de incidencia para 24h


//==========================================================================//
//Calculo da radiacao incidente em cada superficie

for lst=1:24
if ang_incid(lst) >90 | ang_incid(lst) <-90  then 
    ang_incid(lst) = 90
end//Ang incidencia maior que 90 significa que nenhum raio de sol inide direamente, esse laço evita que valores negativos de Et_b surjam

//A resultante deve ser um vetor considerando todas as 24h alem de cada superficie
Y(lst) = max(0.45, 0.55 + 0.437*cosd(ang_incid(lst)) + 0.313*cosd(ang_incid(lst))^2)

Et_b(lst) = Eb(lst)*cosd(ang_incid(lst))//incidencia direta na superficie

if surf_incl <= 90 then
        Et_d(lst) = Ed(lst)*(Y(lst)*sind(surf_incl) + cosd(surf_incl)) //incidencia indireta
    else
        Et_d(lst) = Ed(lst)*Y(lst)*sind(surf_incl)
end


Et_g(lst) = (Eb(lst)*sind(Beta(lst)) +Ed(lst))*rho*(1-cosd(surf_incl))/2 //incidencia a partir do chao (ground)

Etotal(lst) = Et_b(lst) + Et_d(lst) + Et_g(lst) //Incidencia total
end
//=============================================================================//
//CALCULO DA CARGA TERMICA PARA AS PAREDES

//Esse calculo deve ser feito para todas as paredes, posteriormente essa estrutura tem que mudar para computar todas as paredes automaticamente

//A primeira etapa é calcular a temperatura sol-ar

for i = 1:24
T_sol_ar(i) = temp_amb(i,1) + alpha*real(Etotal(i))/h0 - emitanc*DeltaR/h0;
end

//A temperatura Sol-ar é util pra calcular a transferencia de calor por conducao hora a hora

//A Temperatura ambiente deve ser consultada a partir de dados metereologicos ou pelo metodo de calculo em 18.37. Na duvida usar os dados de Atlanta, que possui clima semelhante à de GV no Verão
//O valor de alpha, solar absortance está disponivel em Ashrae 18.23
//h0 coefficient of heat transfer by long-wave radiation sera adotado >>> 17 <<<< devido a falta de informacoes mais precisas
//emitanc é hemispherical emittance of surface é >>> 1 <<< para superficies horizontais e >>> 0 <<< para verticais
//DeltaR é difference between long-wave radiation incident on surface from sky and surroundings and radiation emitted by blackbody at outdoor air temperature. Valor >>>> tipico = 63 <<<



//CALCULO DO PERFIL DE TRANSFERENCIA DE CALOR POR CONDUCAO PRA 24H

for i =1:24
    q_cond(i) = U*A*(T_sol_ar(i)-t_const)
end

//CALCULO DO PERFIL DE CALOR COM A COMPOSICAO DA PARCELA ACUMULADA DAS HORAS ANTERIORES
//EQUIVALENTE AO QUE FOI FEITO PARA RTS LOGO ACIMA

for i=1:24
       cts1= wall_cts_brick (1:i,cts_wall_brick_sel); cts1=cts1($:-1:1,1);
       cts2= wall_cts_brick (i+1:24,cts_wall_brick_sel); cts2=cts2($:-1:1,1);
       cts = cat(1,cts1,cts2)
       q_cond_cts(i) = sum(q_cond.*cts/100)
    
end

    q_cond_cts_conv = q_cond_cts*q_cond_conv 
    
    //Essa multiplicacao separa as porcoes convectiva e radiativa. q_cond_conv é o fator baseado em Ashrae 18.23 table 14. A multiplicacao nao foi feita no laço anterior porque o vetor q_cond_cts precisa se manter inalterado para a parcela radiativa
    
    
    //Calculo do perfil de transferencia radiativa a partir do perfil de conducao. A recomendacao é utilizar Non Solar RTS Ashrae 18.39
    
    rts_cond_sel = 2 //O valor depende do tipo de construcao, nao precisa ser adequado a cada elemento componente da estrutura 
    for i=1:24
           rts1= non_solar_rts_medium(1:i,rts_cond_sel); rts1=rts1($:-1:1,1);
           rts2= non_solar_rts_medium(i+1:24,rts_cond_sel); rts2=rts2($:-1:1,1);
           rts = cat(1,rts1,rts2)
           q_cond_cts_rad(i) = sum(q_cond_cts.*rts*(1-q_cond_conv)/100)
           
    end

q_cond_total = q_cond_cts_rad+q_cond_cts_conv// Valor depois deve ser calculado para cada elemento


[q_cond_pico(1),q_cond_pico(2)] = max(q_cond_total) //Esse vetor armazena o valor do pico e o momento em que acontece com o proposito de dimensionamento e analise posteriormente
endfunction
