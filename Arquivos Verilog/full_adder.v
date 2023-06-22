/*             -------- SOMADOR COMPLETO --------*/

/*  BASE LITERÁRIA: Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”; 
revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;
*/

module full_adder(s, cout, a, b, cin); // SOMAR DOIS BITS RECEBENDO O CARRY DE ENTRADA E OBTER O CARRY DE SAIDA E O RESULTADO DA OPERAÇÃO DE SOMA;
   
    input cin, a, b;
    output s, cout;
    wire s1, cout1, cout2;
   
    half_adder SOMAR_A_E_B(s1, cout1, a, b); // SOMAR OS DOIS BITS;
    half_adder RESULTADO_DE_A_E_B_MAIS_O_CARRY_INPUT(s, cout2, cin, s1); //SOMAR O RESULTADO DA SOMA COM CARRY DE ENTRADA;  
   
    or OBTER_O_CARRY_DE_SAIDA(cout, cout1, cout2); // CASO HAJA UM CARRY DE SAIDA EM ALGUM DOS MEIO SOMADORES, DEFINISSE O CARRY DE SAIDA DO SOMADOR COMPLETO COMO UM;
   
endmodule 