clear
//Carregando arquivos contendo funcoes e tabelas
exec('tabelas.sce',-1) //O parametro -1 suprime informacoes na tela
exec('iluminacao.sce',-1)
exec('paredes.sce',-1)
exec('radiacaof.sce',-1)
exec('ocupacao.sce',-1)
exec('janelas.sce',-1)

//Lista Valores de entrada
entradas = [23.0  	0.4	7	18	1	8	7	18	13	6.5	8.66	14	2	3	17	779.2
]

//[t_const,um_rel,hor_fun_i,hor_fun_f,rts_ilum_sel,p,hor_ocup_i,hor_ocup_f,pma,pba, fresta,porta, rts,U,non_solar(1)] 


//TEMPERATURA DESEJADA PARA O AMBIENTE
t_const = entradas(1)  //Temperatura de bulbo seco
um_rel = entradas(2) //Umidade relativa
//Condicoes Internas recomendadas para o verao. NBR 6401-tab1




////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
////.........................ILUMINACAO.....................

//Horario de funcionamento
hor_fun_i = entradas(3)   //Horario de funcionamento inicio
hor_fun_f = entradas(4)  //Horario de funcionamento fim
q_ilum_pot = entradas(16) //Potencia das lampadas e equipamentos eletronicos equivalentes ligados no mesmo horario. Lampadas = 40W

rts_ilum_sel = entradas(5) //indice pra selecao do rts mais apropriado (a principio apenas valores da tabela medium)
[q_ilum_total,q_ilum_pico]=ilum(hor_fun_i,hor_fun_f,q_ilum_pot,rts_ilum_sel) //CHAMANDO FUNCAO ILUMINACAO


////==========================================================================//
////Surfaces that face west
////have a positive surface azimuth; those that face east have a negative
////surface azimuth.
//surf_azim = 60
//
////Inclinação da superficie em relacao a horizontal,quando a superficie esta na vertical surf = 90, na horizontal surf = 0 e para surperficies apontando para o solo surf >90


////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
////.........................PAREDES COM INSOLACAO.....................

alpha(1)=strtod(alpha_tab(12,2))//Não consta no vetor "entradas"

w = [125.00	90.00	1.00	2.41	14.58	2.40	strtod(alpha_tab(12,2))]

//]Secretaria da FPF
//hall externo
//orient. Interna
//estacionamento



q_cond_pico_total = 0 //Deve permanecer fora do loop
for i = 1:size(w,1)

[q_cond_total(1:24,i),q_cond_pico(1:2,i),ang(i,1:24)] = parede(w(i,1),w(i,2),w(i,3),w(i,4),w(i,5),alpha(1))
q_cond_pico_total = q_cond_total(1:24,i)+q_cond_pico_total//Como existe uma sequencia com valores de pico em momentos diferentes, essa variavel soma todos os valores para descobrir o pico devido a sobreposicao
[q_cond_pico_total_valor(1,1),q_cond_pico_total_valor(2,1)] = max(q_cond_pico_total)
end

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CALCULO PARA OS FRAMES DAS JANELAS
//O metodo de calculo dos frames é mais facilmente realizando quando considerado um processo como o que ocorre nas predes

//alpha(1)=0.27 //Emitancia para aluminio http://wiki.naturalfrequency.com/wiki/Absorptance_and_Emittance
//cts(1)=7//Adequar
//U(1) = 3.18 //Ashrae 15.8 Tab4
//f(1,:) = [-20,90,alpha(1),cts(1),U(1),3.492]//Adequar
//
//alpha(2)=0.27
//cts(2)=7//Adequar
//U(2) = 3.18
//f(2,:) = [70,90,alpha(2),cts(2),U(2),2.152]//Adequar
//
//alpha(3)=0.27 
//cts(3)=7//Adequar
//U(3) = 3.18
//f(3,:) = [160,90,alpha(3),cts(3),U(3),3.492]//Adequar
//
//for i = 1:size(f,1)
//q_frame_pico_total = 0 //Deve permanecer dentro do loop
//[q_frame_total(1:24,i),q_frame_pico(1:2,i)] = parede(f(i,1),f(i,2),f(i,3),f(i,4),f(i,5),f(i,6))
//q_frame_pico_total = q_frame_total(1:24,i)+q_frame_pico_total//Como existe uma sequencia com valores de pico em momentos diferentes, essa variavel soma todos os valores para descobrir o pico devido a sobreposicao
//[q_frame_pico_total_valor(1,1),q_frame_pico_total_valor(2,1)] = max(q_frame_pico_total)
//end
//


//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CALCULO DEVIDO A OCUPACAO
p = entradas(6) //Ocupação em horario de pico ou ocupacao media
//Horario de ocupacao do amiente
hor_ocup_i = entradas(7)   //Horario de funcionamento inicio
hor_ocup_f = entradas(8)  //Horario de funcionamento fim
q_ocup_total = ocupacao(hor_ocup_i,hor_ocup_f,p)


//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CALCULO DEVIDO A INFILTRACAO
//Considerando o método das frestas NBR6401 tab8

pma = entradas(9) //Porta mal ajustada m³/h por metro linear de fresta NBR 6401
pba = entradas(10) //Porta bem ajustada m³/h
fresta = entradas(11) //Estimativa de portas e principalmente janelas, que estão mal ajustadas

porta = entradas(12)//Parcela correspondente a abertura e fechamento das portas m3/h/pessoa
//A alternativa a esse método é utilizar o valor padrao de 1.5 renovacoes/hora NBR 6401. Utilizar essa opcao quando houver uma maior previsibilidade do fluxo de pessoas
//Para intervalos conhecidos de porta aberta usar 1350 m3/h NBR 6401

vazao_infilt = (pma*fresta +porta*p)/3600 //Convertendo para m3/s para compatibilizar unidades
//O valor da vazao de infiltracao pode ser utilizado para reduzir as perdas parametrizando a vazao do ar condicionado para ser >= vazao_inilt gerando uma pressao positiva

ar_calesp = 1006 //Calor especifico ar J/(KG*K)
ar_umid_calesp = 1084 //Calor especifico do ar umido 
ar_dens = 1.2 //Densidade do ar kg/m3
//Ate que possa ser incorporada uma calculadora para esses parametros em tempo real, valores tabelados serao utilizados

umid_abs_ext = 0.0204 //Umidade absoluta para temperatura de 31.4 e umid relat 72% kg/kg
umid_abs_int = 0.007123 //Umidade absoluta para temperatura 23 e umid relat 40% kg/kg
h_ar = 40872 //Entalpia do ar para T=23 e umid rel a 40% J/kg  
//Valores calculados a partir de http://www.sugartech.co.za/psychro/


for i = 1:24
q_infilt(i,1) = ar_dens*(ar_calesp + ar_umid_calesp*(umid_abs_ext-umid_abs_int))*vazao_infilt*(temp_amb(i,1)-t_const)
q_infilt(i,2) = ar_dens*(umid_abs_ext-umid_abs_int)*vazao_infilt*h_ar
end
q_infilt_total = q_infilt(:,1)+q_infilt(:,2)
[q_infilt_pico(1,1),q_infilt_pico(1,2)] = max(q_infilt_total)

//Valores de referencia para ambiente externo T=31.4 UmRel=52% Vlroes para 14:00 março para GV

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//---------------------CALCULO JANELAS ------------------------------

//Para gerar um fator de seguranca no projeto, apesar da janela ser revestida por pelicula ela foi considerada totalmente transparente e mantido o SHGC elevado
rts(1)=entradas(13)
U(1) = entradas(14)
non_solar(1) = entradas(15)
j = w
//j(1,:) = [60,90,rts(1),non_solar(1),U(1),6.92]
//rts(2)=2
////
//U(2) = 1.05
//non_solar(2) = 17   
//j(2,:) = [150,90,rts(2),non_solar(2),U(2),20.736]
//rts(3)=2
////
q_wind_pico_total = 0 //Deve permanecer fora do loop
for i = 1:size(j,1)    
    

[q_wind_total(1:24,i),q_wind_pico(1:2,i)] = janela(j(i,1),j(i,2),rts(1),non_solar(1),U(1),j(i,6))
q_wind_pico_total = q_wind_total(1:24,i)+q_wind_pico_total//Como existe uma sequencia com valores de pico em momentos diferentes, essa variavel soma todos os valores para descobrir o pico devido a sobreposicao
[q_wind_pico_total_valor(1,1),q_wind_pico_total_valor(2,1)] = max(real(q_wind_pico_total))
end

//Preencher a tabela SHGC de acordo com o material mais adequado 

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//---------------------RESULTADO FINAL ------------------------------

q_total = q_infilt_total + q_ilum_total + q_cond_pico_total + q_wind_pico_total +  q_ocup_total
q_total_btu = q_total*3.412141633//Carga em BTU/hr

plot(q_total*3.412141633,'r');plot(q_wind_pico_total*3.412141633,'g');plot(q_infilt_total*3.412141633,'b');plot(q_ocup_total*3.412141633,'c');plot(q_cond_pico_total*3.412141633,'y');plot(q_ilum_total*3.412141633,'k');

//Substituir valores de area e U para cada material
//Criar versão de calculo considerando sombreamento nas paredes e janelas, quando houver sombra é preciso considerar somente as parcelas condutivas e de insolacao difusa nas paredes e janelas


resultado_btu = [q_total,q_infilt_total,q_ilum_total,q_cond_pico_total,q_wind_pico_total,q_ocup_total]*3.412141633
hl=legend(['Calor total';'Janelas';'Infiltração';'Ocupação';'Condução';'Iluminação'])
