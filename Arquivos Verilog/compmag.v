/*              --------COMPARADOR DE MAGNITUDE--------*/

/*BASE LITERÁRIA: Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”;
revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;
*/

// INDENTIFICAR SE O CONJUNTO DE BITS DE "A" É MAIOR, MENOR OU IGUAL EM RELAÇÃO AO CONJUNTO DE BITs DE "B";
module compmag (aeqb, altb,agtb, a3, a2, a1, a0, b3, b2,b1, b0); 

    input a3, a2, a1, a0;
    input b3, b2, b1, b0;
   
    output aeqb, altb,agtb;

    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, b0neg, b1neg, b2neg, b3neg;

    xnor VERIFICAR_SE_A_LSB_E_IGUAL_B_LSB(w0, a0, b0);
    xnor VERIFICAR_SE_A1_E_IGUAL_B1(w1, a1, b1);
    xnor VERIFICAR_SE_A2_E_IGUAL_B2(w2, a2, b2);
    xnor VERIFICAR_SE_A_MSB_E_IGUAL_B_MSB(w3, a3, b3);

    and VERIFICAR_SE_OS_CONJUNTO_SAO_IGUAIS(aeqb, w0, w1, w2, w3); // CASO TODOS OS BITS FOREM COINCIDENTES, ESSES CONJUNTOS SERÃO IGUAIS;

    /*  INVERTER O RESULTADO DO CONJUNTO B*/
    not INVERTER_B0 (b0neg, b0 );
    not INVERTER_B1 (b1neg, b1 );
    not INVERTER_B2 (b2neg, b2 );
    not INVERTER_B3 (b3neg, b3 );

/*  VERIFICAR SE OS BITS "MAIORES" DE "A" SÃO IGUAIS OU MAIORES QUE OS BITs DE "B" */
    and and0 (w4, b3neg, a3);
    and and1 (w5, w3, b2neg, a2);
    and and2 (w6, w3, w2,b1neg, a1);
    and and3 (w7, w3, w2, w1 ,b0neg, a0);

    or VERIFICAR_SE_A_E_MAIOR_QUE_B(agtb, w4, w5, w6, w7); // CASO HAJA ALGUM PORTA AND COM VALOR LOGICO UM, OU SEJA, A MAIOR QUE B, ENTÃO A É MAIOR QUE B;

    nor VERIFICAR_SE_A_E_MENOR_QUE_B(altb, aeqb, agtb); // SE NÃO FOR MAIOR E NEM IGUAL, ENTÃO É MENOR;

endmodule 

