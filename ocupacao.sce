//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CALCULO DEVIDO A OCUPACAO
function q_ocup_total=ocupacao(hor_ocup_i,hor_ocup_f,p)


q_ocup_uso = zeros(24,1)

for i=hor_ocup_i:hor_ocup_f
q_ocup_uso(i)=1     //Equivalente a 100%, se ocorrer algum erro mudar para 100%
end


q_ocup_tab = [70,75] //Calor emitido por pessoa, fonte Ashrae 18 tab1 Bancoss

q_ocup_sens = p*q_ocup_tab(1) //Calor sensivel
q_ocup_lat = p*q_ocup_tab(2) //Calor latente
q_ocup_total = q_ocup_uso*(q_ocup_lat+q_ocup_sens)

endfunction
