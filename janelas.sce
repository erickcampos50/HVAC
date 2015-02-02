function [q_wind_total,q_wind_pico]=janela(surf_azim,surf_incl,rts_wind_sel,rts_wind_non_solar_sel,U,A_wind)

    
//CALCULO DO CALOR INCIDENTE NAS JANELAS
//NOTA: CRIAR PARAMETRO FACIL PARA AVALIAR EFICACIA DA PINTURA SOBRE A JANELA E PRESENÇA DE CORTINAS

//Apos analise a conclusao é que nao é conveniente transcrever todas as tabelas para o calculo de calor entrando nas janelas, portanto mantemse a selecao de parametros apoiada pelo livro

//Chamar funcao paredes para os frames das janelas
//A conducao para janelas utiliza somente a temmperatura externa, nao a temperatura sol-ar

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
end //Ang incidencia maior que 90 significa que nenhum raio de sol inide direamente, esse laço evita que valores negativos de Et_b surjam

//A resultante deve ser um vetor considerando todas as 24h alem de cada superficie
Y(lst) = max(0.45, 0.55 + 0.437*cosd(ang_incid(lst)) + 0.313*cosd(ang_incid(lst))^2)


Et_b(lst) = Eb(lst)*cosd(ang_incid(lst))//incidencia direta na superficie

if surf_incl <= 90 then
        Et_d(lst) = Ed(lst)*(Y(lst)*sind(surf_incl) + cosd(surf_incl)) //incidencia indireta
    else
        Et_d(lst) = Ed(lst)*Y(lst)*sind(surf_incl)
end


Et_g(lst) = (Eb(lst)*sind(Beta(lst)) +Ed(lst))*rho*(1-cosd(surf_incl))/2 //incidencia a partir do chao (ground)
end
IAC = 1; //Considerando janelas sem elementos bloqueadores de luz. Se IAC < 1 o calculo  abaixo é modificado
//Preencher a tabela SHGC de acordo com o material mais adequado 
for i = 1:24
    if ang_incid(i)<90 | ang_incid(i)>-90 then
        k = 6
    end
    if ang_incid(i)<80 |(ang_incid(i)>-80 & ang_incid <0) then
        k = 5
    end
    if ang_incid(i)<70 | (ang_incid(i)>-70 & ang_incid <0) then
        k = 4
    end
    if ang_incid(i)<60 | (ang_incid(i)>-60 & ang_incid <0) then
        k = 3
    end
    if ang_incid(i)<50 | (ang_incid(i)>-50 & ang_incid <0) then
        k = 2
    end
    if ang_incid(i)<40 | (ang_incid(i) >-40 & ang_incid <0) then
        k = 1
    end
    if ang_incid(i) >= 90 | ang_incid(i) <=-90 then
        k=8 //Esse campo deve possuir o valor zero na tabela SHGC
    end

q_wind_b(i) = A_wind*Et_b(i)*SHGC(k)*IAC //Calor incidente de forma direta
q_wind_d(i) = A_wind*Et_d(i)*SHGC(7)*IAC//SHGC_d sera sempre o 7 item da tab SHGC
q_wind_cond(i) = U*A_wind*(temp_amb(i,1)-t_const)

//A_wind é area de vidraca. Buscar saber tambem a espessura para consulta a tabela
//O SHGC é variavel conforme a inclinacao da janela e muda de acordo com o tipo tambem, é preciso inserir os valores corretos no vetor para cada caso
//IAC = indoor solar attenuation coefficient (IAC) represents the fraction
//of heat flow that enters the room, some energy having been excluded
//by the shading. Para janelas sem protecao IAC = 1
end

//CALCULO DO PERFIL DE PRODUCAO DE CALOR DE INCIDENCIA DIRETA CONSIDERANDO O CALOR ACUMULADO NAS HORAS ANTERIORES UTILIZANDO A RTS ADEQUADA
for i=1:24
   rts1= solar_rts(1:i,rts_wind_sel); rts1=rts1($:-1:1,1);
   rts2= solar_rts(i+1:24,rts_wind_sel); rts2=rts2($:-1:1,1);
   rts = cat(1,rts1,rts2)
   q_wind_b_rts(i) = sum(q_wind_b.*rts/100)
end

q_wind_conv_factor = 0.54 //Parcela convectiva correspondente ao calor diuso e por conducao

q_wind_conv = (q_wind_cond+q_wind_d)*q_wind_conv_factor

//Essa multiplicacao separa as porcoes convectiva e radiativa. q_cond_conv é o fator baseado em Ashrae 18.23 table 14. A multiplicacao nao foi feita no laço anterior porque o vetor q_cond_cts precisa se manter inalterado para a parcela radiativa


//Calculo do perfil de transferencia radiativa a partir do perfil de conducao. A recomendacao é utilizar Non Solar RTS Ashrae 18.39


for i=1:24
       rts1= Non_solar_rts_completo(1:i,rts_wind_non_solar_sel); rts1=rts1($:-1:1,1);
       rts2= Non_solar_rts_completo(i+1:24,rts_wind_non_solar_sel); rts2=rts2($:-1:1,1);
       rts = cat(1,rts1,rts2)
       q_wind_dif_cond_rts(i) = sum((q_wind_cond+q_wind_d).*rts*(1-q_wind_conv_factor)/100)
       
end

q_wind_total = q_wind_b_rts + q_wind_conv + q_wind_dif_cond_rts // Valor depois deve ser calculado para cada elemento


[q_wind_pico(1),q_wind_pico(2)] = max(real(q_wind_total)) //Esse vetor armazena o valor do pico e o momento em que acontece com o proposito de dimensionamento e analise posteriormented


endfunction
