//Calculo sombreamento 1

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//CONSTANTES
//Esses valores tem de ser inseridos para cada componente e deixarão de ser constantes nesse momento
dia = 21
mes = 2
lon = -41.93 //Gov Valadares (longitude 41.93E Latitude 18.85S)
TZ = -3  //Timezone
lat = -18.85
//lsm = latatitude, negativa para sul e lon = longitude, negativa para oeste

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//EQUAÇÕES

n = dia+(mes-1)*30.5 //para definir o dia do ano numa sequencia continua, com jan-01=1 e fev-01=32

gama = (360*(n-1)/365)
//Equation of time
ET = 2.2918*(0.0075 + 0.1868 *cosd(gama) - 3.2077* sind(gama)-1.4615* cosd(2*gama) - 4.089* sind(2*gama)) 

//==========================================================================//
//Criação dos vetores que armazenarão valores horarios variaveis, isso é necessario dentro da estrutura interna do scilab
Beta = [1:24]

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

