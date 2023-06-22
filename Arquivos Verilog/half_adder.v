/*             -------- MEIO SOMADOR --------*/

/* BASE LITERÁRIA:Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”; revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;
 */
 
module half_adder(s, cout, a, b); // SOMAR DOIS BITS E OBTER O VALOR DO CARRY DE SAIDA E O RESULTADO DA SOMA;
   
    input a, b;
   
    output s, cout;
   
    wire aux;
   
    and OBTER_CARRY_DE_SAIDA(cout, a, b);  
    xnor xnor11(aux, a, b); // PORTA AUXILIAR PARA OBTER A PORTA XOR;
    not OBTER_O_RESULTADO_DA_SOMA_DE_BITS(s, aux);
   
endmodule 