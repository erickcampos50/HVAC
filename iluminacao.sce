function [q_ilum_total,q_ilum_pico]=ilum(hor_fun_i,hor_fun_f,q_ilum_pot,rts_ilum_sel)

//Cap 18
//=========================================================================//
//Perfil de iluminacao

q_ilum_uso = zeros(1,24)

for i=hor_fun_i:hor_fun_f
q_ilum_uso(i)=1     //Equivalente a 100%, se ocorrer algum erro mudar para 100%
end


fator_conv = 0.52//O fator que define a porção convectiva e radiativa.
q_ilum_conv = q_ilum_uso*(q_ilum_pot*fator_conv)//Porção convectiva da potencia luminosa. Copiar tabelas Ashrae

//CALCULO DO PERFIL DE PRODUCAO DE CALOR DA ILUMINACAO CONSIDERANDO O CALOR ACUMULADO NAS HORAS ANTERIORES UTILIZANDO A RTS ADEQUADA
for i=1:24
   rts1= non_solar_rts_light(1:i,rts_ilum_sel); rts1=rts1($:-1:1,1);
   rts2= non_solar_rts_light(i+1:24,rts_ilum_sel); rts2=rts2($:-1:1,1);
   rts = cat(1,rts1,rts2)
   q_ilum_rad(i) = q_ilum_uso*(q_ilum_pot*(1-fator_conv))*rts()/100
   //FUNCIONANDO
   //O recurso utilizado para contabilização da influencia acumulada de horas anteriores foi a inversão da ordem dos fatores da rts usando como pivo o elemento i. O resultado é [1,2,3,i,5,6]=>[i,3,2,1,6,5]
   //Foi verificado que tanto a inversão do vetor com valores de potencia horaria quanto da propria rts resultam numa operação matricial correta. A vantagem de usar a inversao da rts é a diminuicao de etapas, já que sempre será necessário escolher uma das opções dentro da non_solar_rts
   
end

//Finalizando com o calculo da parcela convectiva e radiativa

for i=1:24
    q_ilum_total(i) =q_ilum_rad(i) +q_ilum_conv(i)
end

[q_ilum_pico(1),q_ilum_pico(2)] = max(q_ilum_total) //Esse vetor armazena o valor do pico e o momento em que acontece com o proposito de dimensionamento e analise posteriormente

//Em Ashrae 18.37 consideram 26% do calor dissipado é extraido pelo sistema de ventilação, no futuro se for conveniente adotar um fator de ponderação como esse
endfunction
