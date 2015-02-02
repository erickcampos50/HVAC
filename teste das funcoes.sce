//Calculadora material de construção paredes

//Entradas////////////////////////////////////////////////////////////////qqq
//Proporcoes da massa: 4x1x1 ou 5x1x1 sao um exemplo, o usuario podera escolher a proproporcao e tambem tera a opcao de usar proporcoes diferentes para massa entre blocos/tijolos e reboco

E1 = [4,1,1];
Ar = E1(1);//Ar - Areia
Cim = E1(2);//Cim - Cimento
Ag = E1(3);//Ag - Agrofilito ou cal

//Considerando as proporcoes de massa as mesmas para os tijolos e reboco
ArR = E1(1);//ArR - Areia para o reboco
CimR = E1(2);//CimR - Cimento para o reboco
AgR = E1(3);//AgR - Agrofilito ou cal para o reboco


//Dimensoes das paredes

E2 = [3,100]
H = E2(1)//H - Altura padrao [m]
L = E2(2)//L - Comprimento linear somado de todas as paredes [m]

//Dimensoes e quantidades das janelas e portas que serao depois subtraidas da area total. Devido a presenca de varios conjuntos de portas e janelas de dimensoes distintas o usuario devera ter a opcao de adicionar novos grupos de entradas. Por exemplo: adiciona o grupo de entradas para as portas e depois clica para uma nova adicao de campos e preenche com os valores de janelas, depois valores de basculantes, etc.

E3 = [.9,3,10]  //Exemplo considerando somente uma entrada para portas com as mesmas dimensoes
VaoL = E3(1) //Largura do vão [m]
VaoH = E3(2) //Altura do vao [m]
VaoQ = E3(3) //Quantidade desses vaos 
VaoT = VaoL*VaoH*VaoQ //Area total dos vaos [m2]

//Dimensoes dos Tijolos ou blocos
E4 = [.2,.3,.1]
TH  = E4(1) //Altura dos tijolos ou blocos [m]
TL = E4(2) //Largura dos tijolos ou blocos [m]
TP = E4(3) //Espessura dos tijolos ou blocos [m]

//Dimensoes da massa
E5 = [.02,.01]
espT = E5(1) //espessura da massa entre os tijolos
espR = E5(2) //espessura do reboco

//Densidade dos materiais
E6 = [1420,1400,3350]
PC = E6(1) //Densidade real do cimento [kg/m³]
PA = E6(2) //Densidade real da areia [kg/m³]
PF = E6(3) //Densidade real do agrofilito [kg/m³]

//Equacoes///////////////////////////////////////////////////////////

//Quantidade de tijolos como funcao da area (m²)
Tij = (H*L-VaoT)/((TH+espT)*(TL+espT)) //Resultado deve ser arredondado para proximo inteiro. A espessura é considerada dessa forma pois e o resultado de metade somado de 2 lados

//Massa necessaria de cimento para os tijlos (kg)
MassCim = Tij*(2*TH*TP*espT/2+2*TL*TP*espT/2)*PC*Cim/(Ar+Cim+Ag)

//Massa necessaria de areia para os tijlos (kg)
MassAr = MassCim*Ar/Cim*PA/PC

//Massa necessaria de agrofilito ou cal para os tijlos (kg)
MassAg = MassCim*Ag/Cim*PF/PC

//Massa necessaria de cimento para o reboco (kg)
MassCimR = (H*L-VaoT)*PC*CimR/(ArR+CimR+AgR)*2 //Multiplicacao feita considerando que a espessura do reboco interno e externo sejam iguais 

//Massa necessaria de areia para o reboco (kg)
MassArR = MassCimR*ArR/CimR*PA/PC

//Massa necessaria de Agrofilito ou cal para o reboco (kg)
MassAgR = MassCimR*AgR/CimR*PF/PC
