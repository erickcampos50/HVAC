//Lista Valores de entrada

//==========================================================================////Surfaces that face west
//have a positive surface azimuth; those that face east have a negative
//surface azimuth.
surf_azim = 60

//Inclinação da superficie em relacao a horizontal,quando a superficie esta na vertical surf = 90, na horizontal surf = 0 e para surperficies apontando para o solo surf >90
surf_incl = 90

//Posteriormente sera necessario o desenvolvimento de lacos que comportem essas superficies individualmente
//Horario de funcionamento
hor_fun_i = 7   //Horario de funcionamento inicio
hor_fun_f = 18  //Horario de funcionamento fim


//Potencia das lampadas e equipamentos eletronicos equivalentes ligados no mesmo horario
q_ilum_pot = 440 //Potencia das lampadas somadas

//TEMPERATURA DESEJADA PARA O AMBIENTE
t_const = 22

//Selecionando coluna da tabela de Non Solar RTS para iluminacaos
rts_ilum_sel = 1 //indice pra selecao do rts mais apropriado (a principio apenas valores da tabela Light)

//Radiaion Absorance alculo da temperatura Sol-ar
alpha = strtod(alpha_tab(12,2)) //Concreto

//Valores extraidos do exemplo. Cada superficie (opaca ou nao) deve possuir seus proprios valores de U e A
U = 0.45//Valores de U e A extraidos do exemmplo Ashrae 18.36 para verificacao dos calculos
A = 11.5

//Exclusivo para conducao em paredes
cts_wall_brick_sel = 1 //Selecao do tipo de cts 


