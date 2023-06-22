/*                      --------DECODIFICADOR DE 7 SEGMENTOS--------*/

module decoder_seven(a, b, c, d, e, f, g, MSB, B, C, LSB);
    /*CONVERTE UMA ENTRADA DE 4 BIT'S EM UMA SAIDA DE 7 BIT'S PARA CONTROLAR O DISPLAY DE 7 SEGMENTOS;
    OBS. O DISPLAY É DE LOGICA NEGATIVA*/
   
    input MSB, B, C, LSB;
    output a, b, c, d, e, f, g; // SEGMENTOS DO DISPLAY;
   
    wire notMSB, notB, notC, notLSB;
    wire aux_c, aux_d, aux_f1, aux_f2;
    
    /*NEGAR OS VALORES DAS ENTRADAS  */
    not INVERTER_MSB (notMSB, MSB);
    not INVERTER_B (notB, B);
    not INVERTER_C (notC, C);
    not INVERTER_LSB (notLSB, LSB);
   
    and DEFINIR_A (a, notMSB, notB, notC, LSB);
   
    or DEFINIR_B (b, B, MSB);
   
    and C_NOT_D (aux_c, C, notLSB);
    or DEFINIR_C (c, aux_c, B, MSB);
   
    and NOT_C_D (aux_d, notC, LSB);
    or DEFINIR_D (d, aux_d, B, MSB);
   
    and DEFINIR_E (e, notMSB, notB, LSB);
   
    and NOT_A_NOT_B_D (aux_f1, notMSB, notB, LSB);
    and NOT_A_NOT_B_C (aux_f2, notMSB, notB, C);
    or DEFINIR_F (f, aux_f1, aux_f2);
   
    and DEFINIR_G (g, notMSB, notB, notC);

endmodule 