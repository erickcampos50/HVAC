clear

//========================================================================//
//Tabelas
temp_amb =[
23.2	20.5
22.8	20.3
22.4	20.2
22.1	20.1
21.8	20.1
22.1	20.1
22.9	20.4
24.8	20.9
27.0	21.6
28.9	22.2
30.7	22.8
31.8	23.1
32.8	23.4
33.3	23.6
33.3	23.6
32.7	23.3
31.7	23.1
30.6	22.7
28.8	22.2
27.6	21.8
26.6	21.5
25.5	21.2
24.6	20.9
23.9	20.7
]//Perfil de Temperatura DB e WB para Atlanta, no mes de Julho. 
non_solar_rts_light = [
47.0	50.0	53.0	41.0	43.0	46.0
19.0	18.0	17.0	20.0	19.0	19.0
11.0	10.0	9.0	12.0	11.0	11.0
6.0	6.0	5.0	8.0	7.0	7.0
4.0	4.0	3.0	5.0	5.0	5.0
3.0	3.0	2.0	4.0	3.0	3.0
2.0	2.0	2.0	3.0	3.0	2.0
2.0	1.0	1.0	2.0	2.0	2.0
1.0	1.0	1.0	1.0	1.0	1.0
1.0	1.0	1.0	1.0	1.0	1.0
1.0	1.0	1.0	1.0	1.0	1.0
1.0	1.0	1.0	1.0	1.0	1.0
1.0	1.0	1.0	1.0	1.0	1.0
1.0	1.0	1.0	0.0	1.0	0.0
0.0	0.0	1.0	0.0	1.0	0.0
0.0	0.0	1.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
0.0	0.0	0.0	0.0	0.0	0.0
] //Light
//With carpet (3), No Carpet(3)
//%glass 10% 50% 90% 10% 50% 90%

non_solar_rts_medium=[ 
49	52
17	16
9	8
5	5
3	3
2	2
2	2
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	0
0	0
0	0
0	0
0	0
]//Medium
//With carpet (2)
//%glass 50% 90%


non_solar_rts_interior=[
46	40	46	31	33	21
19	20	18	17	9	9
11	12	10	11	6	6
6	8	6	8	5	5
4	5	3	6	4	5
3	4	2	4	4	4
2	3	2	4	3	4
2	2	1	3	3	4
1	1	1	3	3	4
1	1	1	2	3	3
1	1	1	2	3	3
1	1	1	2	2	3
1	1	1	1	2	3
1	1	1	1	2	3
1	0	1	1	2	3
0	0	1	1	2	3
0	0	1	1	2	3
0	0	1	1	2	2
0	0	1	1	2	2
0	0	1	0	2	2
0	0	0	0	2	2
0	0	0	0	2	2
0	0	0	0	1	2
0	0	0	0	1	2
]//Interior zone
//Light, Medium, heavy
//With carpet, No Carpet, 3x


solar_rts = [
53	55	56	44	45	46	52
17	17	17	19	20	20	16
9	9	9	11	11	11	8
5	5	5	7	7	7	5
3	3	3	5	5	5	3
2	2	2	3	3	3	2
2	2	2	3	2	2	2
1	1	1	2	2	2	1
1	1	1	1	1	1	1
1	1	1	1	1	1	1
1	1	1	1	1	1	1
1	1	1	1	1	1	1
1	1	1	1	1	0	1
1	1	0	1	0	0	1
1	0	0	0	0	0	1
1	0	0	0	0	0	1
0	0	0	0	0	0	1
0	0	0	0	0	0	1
0	0	0	0	0	0	1
0	0	0	0	0	0	0
0	0	0	0	0	0	0
0	0	0	0	0	0	0
0	0	0	0	0	0	0
0	0	0	0	0	0	0
]//Light (6), Medium(1)
//With carpet (3), No Carpet(3)
//%glass 10% 50% 90% 10% 50% 90%

// O detalhamento de ambas as tabelas e os parametro de escolha estao em Ashrae 18.24

//TABELAS DE CONDUCTION TIME SERIES
wall_cts_brick = [
0.0	0.0	0.0	1.0	2.0	2.0	1.0	3.0	4.0	3.0
5.0	4.0	1.0	1.0	2.0	2.0	1.0	3.0	4.0	3.0
14.0	13.0	7.0	2.0	2.0	2.0	3.0	3.0	4.0	3.0
17.0	17.0	12.0	5.0	3.0	4.0	6.0	3.0	4.0	4.0
15.0	15.0	13.0	8.0	5.0	5.0	7.0	3.0	4.0	4.0
12.0	12.0	13.0	9.0	6.0	6.0	8.0	4.0	4.0	4.0
9.0	9.0	11.0	9.0	7.0	6.0	8.0	4.0	4.0	5.0
7.0	7.0	9.0	9.0	7.0	7.0	8.0	5.0	4.0	5.0
5.0	5.0	7.0	8.0	7.0	7.0	8.0	5.0	4.0	5.0
4.0	4.0	6.0	7.0	7.0	6.0	7.0	5.0	4.0	5.0
3.0	3.0	5.0	7.0	6.0	6.0	6.0	5.0	4.0	5.0
2.0	2.0	4.0	6.0	6.0	6.0	6.0	5.0	5.0	5.0
2.0	2.0	3.0	5.0	5.0	5.0	5.0	5.0	5.0	5.0
1.0	2.0	2.0	4.0	5.0	5.0	4.0	5.0	5.0	5.0
1.0	2.0	2.0	4.0	5.0	5.0	4.0	5.0	5.0	5.0
1.0	1.0	1.0	3.0	4.0	4.0	3.0	5.0	4.0	4.0
1.0	1.0	1.0	3.0	4.0	4.0	3.0	5.0	4.0	4.0
1.0	1.0	1.0	2.0	3.0	4.0	3.0	4.0	4.0	4.0
0.0	0.0	1.0	2.0	3.0	3.0	2.0	4.0	4.0	4.0
0.0	0.0	1.0	2.0	3.0	3.0	2.0	4.0	4.0	4.0
0.0	0.0	0.0	1.0	3.0	3.0	2.0	4.0	4.0	4.0
0.0	0.0	0.0	1.0	2.0	2.0	1.0	4.0	4.0	4.0
0.0	0.0	0.0	1.0	2.0	2.0	1.0	4.0	4.0	3.0
0.0	0.0	0.0	0.0	1.0	1.0	1.0	3.0	4.0	3.0
]

wall_cts_others = [
18.0	25.0	8.0	19.0	6.0	7.0	5.0	11.0	2.0	1.0
58.0	57.0	45.0	59.0	42.0	44.0	41.0	50.0	25.0	2.0
20.0	15.0	32.0	18.0	33.0	32.0	34.0	26.0	31.0	6.0
4.0	3.0	11.0	3.0	13.0	12.0	13.0	9.0	20.0	9.0
0.0	0.0	3.0	1.0	4.0	4.0	4.0	3.0	11.0	9.0
0.0	0.0	1.0	0.0	1.0	1.0	2.0	1.0	5.0	9.0
0.0	0.0	0.0	0.0	1.0	0.0	1.0	0.0	3.0	8.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	2.0	7.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0	6.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	6.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	5.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	5.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	4.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	4.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	3.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	3.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	3.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	2.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	2.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	2.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	2.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	1.0
0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0
]

alpha_tab = [
'Brick, red (Purdue) a'	'0.63'
'Paint Red'	'0.63'
'Paint Black'	'0.94'
'Paint Sandstone'	'0.50'
'Paint White acrylic'	'0.26'
'Sheet metal, galvanized new'	'0.65'
'Sheet Metal Galvanized, Weathered a'	'0.80'
'Shingles Gray b'	'0.82'
'Shingles Brown b'	'0.91'
'Shingles Black b'	'0.97'
'Shingles White b'	'0.75'
'Concrete a,c'	'0.7'
]//Essa tabela foi extraida de Ashrae  18.23: Solar abortance
//É preciso usar o comando strtod na extracao de valores numericos, pois todos estao registrados como strings

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CONSTANTES
//Esses valores tem de ser inseridos para cada componente e deixarão de ser constantes nesse momento
dia = 21
mes = 2
lon = -41.93 //Gov Valadares
TZ = -3 
lat = -18.85//function r1=rad (TZ, lon, dia, mes)    
//lsm = latatitude, negativa para sul e lon = longitude, negativa para oeste

Esc = 1367//Solar constant W/m2


//==========================================================================////Surfaces that face west
//have a positive surface azimuth; those that face east have a negative
//surface azimuth.
surf_azim = 60

 //Inclinação da superficie em relacao a horizontal,quando a superficie esta na vertical surf = 90, na horizontal surf = 0 e para surperficies apontando para o solo surf >90
surf_incl = 90

//Posteriormente sera necessario o desenvolvimento de lacos que comportem essas superficies individualmente

rho = 0.2 //indice de reflectancia do solo. Existe uma tabela mais completa em Ashrae 14.11


q_ilum_pot = 440 //Potencia das lampadas somadas

rts_ilum_sel = 1 //indice pra selecao do rts mais apropriado (a principio apenas valores da tabela Light)

//TEMPERATURA DESEJADA PARA O AMBIENTE
t_const = 22

//Constantes para calculo da temperatura Sol-ar
alpha = strtod(alpha_tab(12,2)) //Concreto
h0 = 17
emitanc = 0
DeltaR = 63 



//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//EQUAÇÕES

n = dia+(mes-1)*30.5 //para definir o dia do ano numa sequencia continua, com jan-01=1 e fev-01=32

E0 = Esc*(1+0.033*cosd(360*(n-3)/365))


gama = (360*(n-1)/365)
//Equation of time
ET = 2.2918*(0.0075 + 0.1868 *cosd(gama) - 3.2077* sind(gama)-1.4615* cosd(2*gama) - 4.089* sind(2*gama)) 

//==========================================================================//
//Criação dos vetores que armazenarão valores horarios variaveis, isso é necessario dentro da estrutura interna do scilab
Beta = [1:24]
Eb = [1:24]
Ed = [1:24]

//==========================================================================//
//INICIO DO LAÇO FOR 

for lst=1:24

//==========================================================================//
//Cálculo da radiação incidente

//{The earth’s orbital velocity also varies throughout the year, so
//apparent solar time (ast), as determined by a solar time sundial,
//varies somewhat from the mean time kept by a clock running at a
//uniform rate. This variation is called the equation of time (ET)and
//is approximated by the following formula (Iqbal 1983):}

lsm = 15*TZ

ast(lst) = lst + ET/60 + (lon - lsm)/15  //apparent solar time
                                    //lsm = latocal standard time, o horario para o qual está sendo calculado. Considerar o horario padrão mesmo no horario de verao.
           

sigma = 23.45*sind((360*(n+284)/365)); //the solar declination δ(the angle between the earth-sun line and the equatorial plane) varies throughout the yea



H(lst) = 15*(ast(lst) - 12); //hour angle
// hour angle H, defined as the angular displacement of
//the sun east or west of the local meridian due to the rotation of the
//earth, and expressed in degrees as
//H= 15(AST – 12) (11)
//where AST is the apparent solar time [Equation (7)]. His zero at
//solar noon, positive in the afternoon, and negative in the morning
//
b = asind(cosd(lat)*cosd(sigma)*cosd(H(lst))+sind((lat))*sind(sigma));//altitude solar, todos esses valores já foram convertidos em radianos,
                                                            //portanto o resultado final do asind é em radianos e nao precisa edicao


phi(lst) = asind(sind(H(lst))*cosd(sigma)/cosd(b));//azimute solar,
//phi = acosd(cosd(H)*cosd(sigma)*sind(lat)-sind(sigma)*cosd(lat)/cosd(b)) //apresenta erro, por isso foi abandonado

m = 1/(sind(b)+ 0.50572*(6.07995+b)^-1.6364)

if b<0 then //Existe um ponto de singularidade quando beta <0, por isso esse recurso é utilizado, para nao haver saturacao da memoria, loops ou erros semelhantes
    b=0
end

Beta(lst)=b //É utilizado para registro da variacao da altitude solar ao longo das 24hrs

taub = [0.325, 0.349, 0.383, 0.395, 0.448, 0.505, 0.556, 0.593, 0.431, 0.373, 0.339, 0.320]//Se possivel tornar esse vetor editavel via UI
taud = [2.461, 2.316, 2.176, 2.175, 2.028, 1.892, 1.779, 1.679, 2.151, 2.317, 2.422, 2.514]


ab= 1.219 - 0.043*taub(mes) - 0.151*taud(mes) - 0.204*taub(mes)*taud(mes) //beam and diffuse air mass exponents
ad= 0.202 + 0.852*taub(mes) - 0.007*taud(mes) - 0.357*taub(mes)*taud(mes) //o indice mes-1 é porque o vetor tem primeiro indice = 0


Eb(lst) = E0*exp(-taub(mes)*(m^ab)) //Eb := beam normal irradiance (measured perpendicularly to rays of the sun)
Ed(lst) = E0*exp(-taud(mes)*(m^ad))//Ed := diffuse horizontal irradiance (measured on horizontal surface)

//Por falta de uma fonte mais precisa os valores de taub e taud são os válidos para Atlanta,
//The CRC Handbook of Mechanical Engineering, Second Edition p.7-50 possui uma tabela global,
// mas como as equações são diferentes a principio preferi utilizar os valores de Atlanta mesmo

end

//A formula sofre singularidade para momentos em que nõ existe luz do dia disponivei, produzindo numeros complexos com valores absurdos. Não ocorre erro no script, mas são gerados valores que prejudicarão a continuidade do calculo. Para resolver isso é feita uma comparação dos valores da lista de Radiação solar direta e difusa e compara-se a parte imaginaria com o valor de referencia identificado no padrão de "erro". Uma vez identificada a ocorrencia, a intensidade é artificialmente transformada em zero

for lst=1:24         
    if imag(Eb(lst)) >0 then
        Eb(lst) = 0
        
    end
    if imag(Ed(lst)) >0 then
        Ed(lst) = 0
        
    end
    end

//==========================================================================//
//A partir desse ponto inicia o calculo especifico para superficies

surf_sol_azim(1,:) = phi-surf_azim //Valores levemente diferentes dos ideais, verificar

ang_incid = acosd(cosd(Beta).*cosd(surf_sol_azim)*sind(surf_incl) + sind(Beta)*cosd(surf_incl)) //Angulo de incidencia, é o angulo entre a superficie e os raios com incidencia direta, faz diferenca no calculo da radiacao direta
//Testado e Funcionando
//ang_incid gera um vetor com angulo de incidencia para 24h

//==========================================================================//
//Calculo da radiacao incidente em cada superficie

for lst=1:24

//A resultante deve ser um vetor considerando todas as 24h alem de cada superficie
Y(lst) = max(0.45, 0.55 + 0.437*cosd(ang_incid(lst)) + 0.313*cosd(ang_incid(lst))^2)
if ang_incid(lst) >90 | ang_incid(lst) <0  then 
    ang_incid(lst) = 90
end
//Ang incidencia maior que 90 significa que nenhum raio de sol inide direamente, esse laço evita que valores negativos de Et_b surjam
Et_b(lst) = Eb(lst)*cosd(ang_incid(lst))//incidencia direta na superficie

if surf_incl <= 90 then
        Et_d(lst) = Ed(lst)*(Y(lst)*sind(surf_incl) + cosd(surf_incl)) //incidencia indireta
    else
        Et_d(lst) = Ed(lst)*Y(lst)*sind(surf_incl)
end


Et_g(lst) = (Eb(lst)*sind(Beta(lst)) +Ed(lst))*rho*(1-cosd(surf_incl))/2 //incidencia a partir do chao (ground)

Etotal(lst) = Et_b(lst) + Et_d(lst) + Et_g(lst) //Incidencia total
end



//Cap 18
//=========================================================================//
//Perfil de iluminacao

q_ilum_uso = zeros(1,24)
//Horario de funcionamento
hor_fun_i = 7   //Horario de funcionamento inicio
hor_fun_f = 18  //Horario de funcionamento fim

for i=hor_fun_i:hor_fun_f
    q_ilum_uso(i)=1     //Equivalente a 100%, se ocorrer algum erro mudar para 100%
end



fator_conv = 0.52//O fator que define a porção convectiva e radiativa 
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//O Calculo deve ser depois feito para cada superficie. A área e a condutividade deixam de ser constantes e passam a ser parametro especificos
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U = 0.45//Valores de U e A extraidos do exemmplo Ashrae 18.36 para verificacao dos calculos
A = 11.5

//CALCULO DO PERFIL DE TRANSFERENCIA DE CALOR POR CONDUCAO PRA 24H

for i =1:24
    q_cond(i) = U*A*(T_sol_ar(i)-t_const)
end

//CALCULO DO PERFIL DE CALOR COM A COMPOSICAO DA PARCELA ACUMULADA DAS HORAS ANTERIORES
//EQUIVALENTE AO QUE FOI FEITO PARA RTS LOGO ACIMA

cts_wall_brick_sel = 1 //Selecao do tipo de cts

for i=1:24
       cts1= wall_cts_brick (1:i,cts_wall_brick_sel); cts1=cts1($:-1:1,1);
       cts2= wall_cts_brick (i+1:24,cts_wall_brick_sel); cts2=cts2($:-1:1,1);
       cts = cat(1,cts1,cts2)
       q_cond_cts(i) = sum(q_cond.*cts/100)
    
end
q_cond_conv = 0.54 //Posteiormente deve ser deslocado para secao constantes
q_cond_cts_conv = q_cond_cts*q_cond_conv 

//Essa multiplicacao separa as porcoes convectiva e radiativa. q_cond_conv é o fator baseado em Ashrae 18.23 table 14. A multiplicacao nao foi feita no laço anterior porque o vetor q_cond_cts precisa se manter inalterado para a parcela radiativa


//Calculo do perfil de transferencia radiativa a partir do perfil de conducao. A recomendacao é utilizar Non Solar RTS Ashrae 18.39

rts_ilum_sel = rts_ilum_sel //A principio utilizando o mesmo fator de RTS da etapa anterior
for i=1:24
       rts1= non_solar_rts_light(1:i,rts_ilum_sel); rts1=rts1($:-1:1,1);
       rts2= non_solar_rts_light(i+1:24,rts_ilum_sel); rts2=rts2($:-1:1,1);
       rts = cat(1,rts1,rts2)
       q_cond_cts_rad(i) = sum(q_cond_cts.*rts*(1-q_cond_conv)/100)
       
end

q_cond_total = q_cond_cts_rad+q_cond_cts_conv// Valor depois deve ser calculado para cada elemento


[q_cond_pico(1),q_cond_pico(2)] = max(q_cond_total) //Esse vetor armazena o valor do pico e o momento em que acontece com o proposito de dimensionamento e analise posteriormente

//CALCULO DO CALOR INCIDENTE NAS JANELAS
//NOTA: CRIAR PARAMETRO FACIL PARA AVALIAR EFICACIA DA PINTURA SOBRE A JANELA E PRESENÇA DE CORTINAS

//Apos analise a conclusao é que nao é conveniente transcrever todas as tabelas para o calculo de calor entrando nas janelas, portanto mantemse a selecao de parametros apoiada pelo livro


//for i = 1:24
//    if  then
//    end
//q_wind_b(i)clear = A_wind*Et_b(i)*SHGC(k)*IAC //Calor incidente de forma direta
//q_wind_d(i) = A_wind*Et_d(i)*SHGC_d*IAC//A_wind é area de vidraca. Buscar saber tambem a espessura para consulta a tabela
//O SHGC é variavel conforme a inclinacao da janela e muda de acordo com o tipo tambem, é preciso inserir os valores corretos no vetor para cada caso
//IAC = indoor solar attenuation coefficient (IAC) represents the fraction
//of heat flow that enters the room, some energy having been excluded
//by the shading. Para janelas sem protecao IAC = 1





//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CALCULO DEVIDO A OCUPACAO
