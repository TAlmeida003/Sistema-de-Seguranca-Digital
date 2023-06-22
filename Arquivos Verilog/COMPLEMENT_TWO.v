/*              -------- COMPLEMENTO DE DOIS-------- */
/*  BASE LITERÁRIA: Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”;
 revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;
 */

module COMPLEMENT_TWO(S3, S2, S1, S0, cout, A3, A2, A1, A0, B3, B2, B1, BO);

    input A3, A2, A1, A0; // REPRESENTAÇÃO BINARIA DA PARCELA 1;
    input B3, B2, B1, BO; // REPRESENTAÇÃO BINARIA DA PARCELA 2;
   
    output S3, S2, S1, S0, cout; // RESULTADO DAS PARCELAS E O CARRY DE SAÍDA;
   
    wire cout0, cout1, cout2; // CARRY DE SAÍDA AUXILIARES;
    wire not_B3, not_B2, not_B1, not_B0; // FIOS DA NEGAÇÃO DE B;
   
   /*NEGAR O CONJUNTO DE BITs DE B*/
    not INVERTER_B0(not_B0,BO);
    not INVERTER_B1(not_B1,B1);
    not INVERTER_B2(not_B2,B2);
    not INVERTER_B3(not_B3,B3);
   
    full_adder SOMAR_BIT_LSB(S0, cout0, A0, not_B0, 1'b1); // SOMAR O BIT LSB DE "A" E "B", MAIS UM BIT NO CARRY DE ENTRADA, OBTENDO ASSIM, O S LSB;  
    full_adder SOMAR_BIT_1(S1, cout1, A1, not_B1, cout0); // SOMAR O BIT 1 DE "A", "B" E O CARRY DE SAÍDA DA OPECAÇÃO ANTERIOR, OBTENDO ASSIM, O S 1;
    full_adder SOMAR_BIT_2(S2, cout2, A2, not_B2, cout1); // SOMAR O BIT 2 DE "A" E "B", O CARRY DE SAÍDA DA OPECAÇÃO ANTERIOR, OBTENDO ASSIM, O S 2;
    full_adder SOMAR_BIT_MSB(S3, cout, A3, not_B3, cout2); // SOMAR O BIT MSB DE "A" E "B", O CARRY DE SAÍDA DA OPECAÇÃO ANTERIOR, OBTENDO ASSIM, O S MSB;
   
endmodule 

