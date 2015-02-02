//Calculo de area sombreada
//Fonte: Pongpattana, C., & Rakkwamsuk, P. (2006). Efficient algorithm and computing tool for shading calculation. Songklanakarin Journal of Science and Technology, 28(August 2005), 375–386.

//Notas: 
// Y e a notação dos pontos : Durante todo o calculo é importante manter um controle sobre o refrencial utilizado na notação dos pontos descritivos do elemento de sombra. O referencial muda de X para Y facilitando a notação, porem diversos elementos de sombra possuem componentes adicionais (como os Eggcrate) e não necessariamente esses elementos sao facilmente descritos pelo plano de trabalho Y. Por isso a notação dos pontos não deve ser feita mecanicamente, pois diversas matrizes de transformacao podem ser necessarias no processo ou um calculo de deslocamento para identificar onde de fato os pontos estao (nao confiar no referencial visual somente)
//X e a notação dos objetos : O referencial X nao corresponde a orientacao das fachadas a ser analisadas, por isso é importante fazer ajustes de orientacao sempre que necessario. >>>> Verificar se a propria transformada Axy já é o suficiente para todos os casos <<<<

////////////////////////LEGENDA////////////////////////////
//Beta = Tilt angle
//Gama = Azimute de superficie (Ashrae)
//Alpha = Altitude solar
//GamaS = Azimute solar
//X = Eixos ordinarios (zenite, leste e norte) --Conferir Nota
//Vs = Posicao do sol (vetor unitario)
//Vy = Posicao do plano (vetor unitario)
//Yp = vetor de um ponto P
////Ys = vetor da sombra do ponto P
//Axy = transformada para converter os eixos ordinarios para o referencial do plano analisado
//Y = Eixos com referencial no plano sombreador --Conferir Nota
//Ai = Area calculada pela triangulacao dos pontos Pi, Pi+1, Pi+2. Sendo que Yi = 0 pois os pontos estao no plano. O calculo dessa area esta na pagina 5.

vs =[sin(alpha);
    -cos(alpha)*sin(gamaS);
    -cos(alpha*cos(gamaS)]

vy = [sin(beta);
    -cos(beta*sin(gama);
    -cos(beta)*cos(gama)]

Axy = [cos(beta), sin(gama)*sin(beta),-cos(gama)*sin(beta);
    0, cos(gama),sin(gama);
    sin(beta),-cos(beta)*sin(gama),cos(gama)*cos(beta)]

//Devido a falta de informacoes o metodo apresentado no artigo sera abandonado e um novo metodo vetorial sera desenvolvido do zero.

//O metodo utiliza a mesma logica vetorial do artigo, seguindo os seguintes passos:

//1 - Um referencial conveniente é escolhido como fixo, ele sera utilizado para definir a altitude solar, o azimute solar e outros elementos geometricos. Sera adotado o ereferencial da Ashrae
//2 - Um segundo referencial fixo sera escolhido de modo que o plano de interesse se situe na fachada a ser analisada. 
//3 - Sera gerado um referencial secundario a partir do plano da fachada. O referencial vai acompanhar o plano do sombreador (inclusive com a inclinacao quando houver). 
//Com a origem em uma das quinas convenientes. Esse referencial tem o proposito de facilitar a insercao dos dados geometricos do sombreador.
//Isso sera feito atraves de uma matriz de rotacao e translacao aplicada
//4 - Se for feita uma translacao entao é preciso criar um mecanismo pra evitar o surgimento de areas negativas
//5 - Caso seja conveniente pode ser feita uma transformacao em cada um dos elementos distintos do sombreador. É importante lembrar de desfazer tambem essas transformacoes
//6 - Utilizando os angulos caracteristicos sera feita uma projecao de cada ponto importante de geometria do sombreador sobre o plano da base do referencial secundario.
//7 - Sera feita a projecao desses pontos no plano fixo da fachada
//9 - Sera delimitado quando conveniente a regiao de interesse pra que a regiao sombreada contabilizada seja de fato util ao proposito
//8 - Atraves de uma triangulacao de pontos sera feito o calculo de area cada elemento compondo a regiao de sombra e a somatoria sera a area total sombreada
