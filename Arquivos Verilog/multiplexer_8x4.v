/*                      --------MULTIPLEXADOR 8x4--------*/


module multiplexer_8x4(out_msb, out_b, out_c, out_lsb, MSB_L0, B_LO, C_L0, LSB_L0, MSB_L1, B_L1, C_L1, LSB_L1, S); // RECEBER DOIS COJUNTO DE 4 BITs E SELECIONAR UM DESSES CONJUNTOS DE BITs A PARTIR DO RESULTADO DE "S";

    input MSB_L0, B_LO, C_L0, LSB_L0;   // BITs DO PRIMEIRO CONJUNTO "L0";
    input MSB_L1, B_L1, C_L1, LSB_L1; // BITs DO SEGUNDO CONJUNTO "L1";
    input S; // ENTRADA DE HABILITAÇÃO — SE "S" FOR IGUAL A 0, ENTÃO SELECIONE O CONJUNTO L0, CASO O CONTRARIO ESCOLHA L1
    
    output out_msb, out_b, out_c, out_lsb; // CONJUNTO DE BITs SELECIONADOS;
   
   /* OS BITS SELECIONADOS PELOS MUX PERTENCERAM AO MESMO CONJUNTO; */
    multiplexer_2x1 SELECIONAR_BIT_MSB(out_msb, MSB_L0, MSB_L1, S);
   
    multiplexer_2x1 SELECIONAR_BIT_B(out_b, B_LO, B_L1, S);
   
    multiplexer_2x1 SELECIONAR_BIT_C(out_c, C_L0, C_L1, S);
   
    multiplexer_2x1 SELECIONAR_BIT_LSB(out_lsb, LSB_L0, LSB_L1, S);
   
endmodule 