/*                               -------COFRE DE SEGUNRANÇA-------*/

/* COLABORADORES: Gabriel Sousa Sampaio, Emanuel Antônio Lima Pereira, Thiago Neri dos Santos Almeida 
: */

/*
BASE TEÓRICA:    Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”; revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;

*/

module main (LED_R, LED_B, LED_G, DP, G, F, E, D, C, B, A, CH7, CH6, CH5, CH4, CH3, CH2, CH1, CH0, s1, s2, s3);

    input CH0, CH1, CH2, CH3;                    // CHAVES QUE REPRESENTAM AS TENTATIVAS DE SENHA, QUE ABREM O COFRE;
    input CH4, CH5, CH6, CH7;                    // CHAVES QUE REPRESENTAM A SENHA CADASTRADA PARA ABRIR O COFRE;
   
    output  G, F, E, D, C, B, A, DP;             // SEGMENTOS DO DISPLAY DE 7 SEGMENTOS;
    output LED_R, LED_B, LED_G;                  // CONTROLAR A LIGAÇÃO E DESLIGAMENTO DO LED RGB, O LED LIGA NAS CORES VERMELHO, AZUL E  VERDE;
    output  s1, s2, s3;                          // DESLIGAR OS 3 DIGITOS DO DISPLAY;
   
    wire equal, smaller, big, equal_s, smaller_s, bigs; // FIOS DE SAÍDA DO COMPARADOR DE MAGNITUDE;
    wire S3, S2, S1, S0, cout1;                  // FIOS DE SAÍDA DO SOMADOR COM COMPLEMENTO DE DOIS;
    wire INV_SUM0, INV_SUM1, INV_SUM2, INV_SUM3; //INVETER O RESULTADO DA PRIMEIRA SOMA;
    wire is0, is1, is2, is3, icout;              // RESULTADO DO SEGUNDO COMPLEMENTO DE DOIS;
    wire ms3, ms2, ms1, ms0;                     // RESULTADO DO MULTIPLEXADOR;
    wire not_green, WIRE_BLUE;
   
   // VERIFICAR ATRAVÉS DO COMPARADOR DE MAGNITUDE SE A SENHA DE TENTATIVA  É MENOR OU IGUAL A SENHA DE CADASTRADA;
    compmag COMPARAR_SENHA_INSERIDA_COM_CADASTRADA(equal, smaller, big, CH3,CH2, CH1, CH0, CH7, CH6, CH5, CH4); 
   
   // OBTER A DIFERENÇA ENTRE A SENHA INSERIDA DA SENHA CADASTRADA ATRAVÉS DE COMPLEMENTO DE DOIS  — senha inserida - senha cadastrada —;
    COMPLEMENT_TWO SUBTRACAO_A_PARTIR_DE_COMPLEMENTO_DE_2(S3, S2, S1, S0, cout1,CH3,CH2, CH1, CH0, CH7, CH6, CH5, CH4); 
   
   /*NEGAR O RESULTADO DA DIFERENÇA ENTRE A SENHA INSERIDA DA SENHA CADASTRADA — COMPLEMENTO DE UM — ;*/
    not notSUM1 (INV_SUM3, S3);
    not notSUM2 (INV_SUM2, S2);
    not notSUM3 (INV_SUM1, S1);
    not notSUM4 (INV_SUM0, S0);
   
   // REALIZAR O COMPLEMENTO DE 2 DA NEGAÇÃO DA PRIMEIRA DIFERENÇA;
    COMPLEMENT_TWO COMPLEMENTO_DE_2_PRIMEIRA_SUBTRACAO(is3, is2, is1, is0, icout, INV_SUM3, INV_SUM2, INV_SUM1, INV_SUM0, 1'b1, 1'b1, 1'b1, 1'b1); 
   
   // SELECIONAR, A PARTIR DO RESULTADO LÓGICO DO FIO "MENOR" DO COMPARADOR DE MAGNITUDE, SE A SAÍDA SERÁ DO PRIMEIRO OU DO SEGUNDO SOMADOR COM COMPLEMENTO DE DOIS;
    multiplexer_8x4 SELECIONAR_RESULTADO_DOS_COMPLENTOS(ms3, ms2, ms1, ms0, S3, S2, S1, S0, is3, is2, is1, is0, smaller); 
   
   // A PARTIR DO RESULTADO DO MULTIPLEXADOR, REPRESENTAR NO DISPLAY: 0, 1, 2, 3 OU F;
    decoder_seven CONVERTER_CODIGO_BINARIO_PARA_7_SEGMENTOS(A, B, C, D, E, F, G, ms3, ms2, ms1, ms0); 
   
   // VERIFICAR SE O RESULTADO DO MULTIPLEXADOR É NENOR QUE 4;
    compmag COMPARAR_SE_O_RESULTADO_E_MENOR_QUE_4(equal_s, smaller_s, bigs, ms3, ms2, ms1, ms0, 1'b0, 1'b1,1'b0,1'b0); 
   
   // LIGAR LED RGB NA COR VERDE, PARA REPRESENTAR QUE O COFRE ESTAR ABERTO, CASO A SENHA INSERIDA SEJA IGUAL A SENHA CADASTRADA;
    not LIGAR_LED_VERDE1(not_green, equal);
    not LIGA5_LED_VERDE2(LED_G, not_green); 
   
    and and15(WIRE_BLUE, smaller_s, not_green);

    //  LIAGR LED RGB NA COR AZUL, PARA REPRESENTAR QUE O COFRE ESTAR ABERTO, PORÉM A SENHA INSERIDA É ATÉ TRÊS CASAS MAIOR OU MENOR QUE A CADASTRADA;
    and LIGAR_LED_AZUL(LED_B, smaller_s, not_green);

     // LIGAR LED RGB NA COR VERMELHO, PARA REPRESENTAR QUE O COFRE ESTAR FECHADO;      
    nor LIGAR_LED_VERMELHO(LED_R, smaller_s, equal);

    // LIGAR O PONTO NO DISPLAY PARA REPRESENTAR UM NÚMERO NEGATIVO;
    nand CONTROLAR_O_SINAL_DE_MAGNITUDE_DO_DISPLAY(DP, smaller, WIRE_BLUE);

    // DESLIGAR OS 3 DIGITOS DO DISPLAY;
    off_display DESLIGAR_DISPLAY(1'b1, 1'b1, s1, s2, s3);
    
endmodule 