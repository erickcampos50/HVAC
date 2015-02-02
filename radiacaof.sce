//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CONSTANTES
//Esses valores tem de ser inseridos para cada componente e deixarão de ser constantes nesse momento
dia = 21
mes = 8
lon = -41.93 //Gov Valadares (longitude 41.93E Latitude 18.85S)
TZ = -5 
lat = -18.85
//lsm = latatitude, negativa para sul e lon = longitude, negativa para oeste

Esc = 1367//Solar constant W/m2


rho = 0.2 //indice de reflectancia do solo - Dry grassland e Typical ciy entre. Existe uma tabela mais completa em Ashrae 14.11
        
        
        //Constantes para calculo da temperatura Sol-ar
        h0 = 17
        emitanc = 0
        DeltaR = 63 
        
        q_cond_conv = 0.54 //Constante que define a parcela convectiva e radiativa usada para calculo do calor devido a conducao. Referencia Ashrae 18.23 Tab 14
        
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
p
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

ab= 1.219 - 0.043*taub(mes) - 0.151*taud(mes) - 0.204*taub(mes)*taud(mes) //beam and diffuse air mass exponents
ad= 0.202 + 0.852*taub(mes) - 0.007*taud(mes) - 0.357*taub(mes)*taud(mes) //o indice mes-1 é porque o vetor tem primeiro indice = 0


Eb(lst) = E0*exp(-taub(mes)*(m^ab)) //Eb := beam normal irradiance (measured perpendicularly to rays of the sun)
Ed(lst) = E0*exp(-taud(mes)*(m^ad))//Ed := diffuse horizontal irradiance (measured on horizontal surface)

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





