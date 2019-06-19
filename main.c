#include<stdio.h>
#include<string.h>
#include <stdlib.h>
#include <ctype.h>

int indiceLetra(char letra,char alfabeto[]){
    int i = 0;
    while(alfabeto[i]!=letra){
        i++;        
    }
    return ++i;
}

void generaAlfabeto(char alfabeto[]){
    for(int i = 0;i<26;i++){
        alfabeto[i] = 65 + i;
    }
}

void convetirMayusculas(char mensaje[]){
    for (int indice = 0; mensaje[indice] != '\0'; ++indice){
		mensaje[indice] = toupper(mensaje[indice]);
	}
}

char aumentar_letra(char letra,int aumento){
    int letra_t = letra;
    int letra_aumentada = letra_t + aumento;
    
    if(letra_aumentada > 90){
        letra_aumentada -= 26;
    }
    
    return letra_aumentada;
    
}

char* cifrado_principal(char* palabra,int numero){
    char* nueva_palabra = (char *)malloc(sizeof(char)*strlen(palabra));
    for(int i = 0;i<strlen(palabra);i++){
        int caracter = palabra[i];
        *(nueva_palabra+i) = aumentar_letra(caracter,numero);
    }
    return nueva_palabra;
}

/*definicon de las variantes de los cifrados secundarios*/
char* c_secun_1_a(char* palabra){
	printf("Aplicando el cifrado secundario 1 A\n");
	return palabra;
}

char* c_secun_1_e(char* palabra){
	printf("Aplicando el cifrado secundario 1 E\n");
	return palabra;
}

char* c_secun_1_i(char* palabra){
	printf("Aplicando el cifrado secundario 1 I\n");
	return palabra;
}

char* c_secun_1_o(char* palabra){
	printf("Aplicando el cifrado secundario 1 O\n");
	return palabra;
}

char* c_secun_1_u(char* palabra){
	printf("Aplicando el cifrado secundario 1 U\n");
	return palabra;
}
//=================================================//
char* c_secun_2_a(char* palabra){
	printf("Aplicando el cifrado secundario 1 A\n");
	return palabra;
}

char* c_secun_2_e(char* palabra){
	printf("Aplicando el cifrado secundario 1 E\n");
	return palabra;
}

char* c_secun_2_i(char* palabra){
	printf("Aplicando el cifrado secundario 2 I\n");
	return palabra;
}

char* c_secun_2_o(char* palabra){
	printf("Aplicando el cifrado secundario 2 O\n");
	return palabra;
}

char* c_secun_2_u(char* palabra){
	printf("Aplicando el cifrado secundario 2 U\n");
	return palabra;
}


void cifrado_secundario_1(char* palabra,char codigo){
	switch (codigo){
	    case 'A':
	        c_secun_1_a(palabra);
	        break;
	    case 'E':
		    c_secun_1_e(palabra);
	        break;
   	    case 'I':
	   	    c_secun_1_i(palabra);
	        break;
		case 'O':
	        c_secun_1_o(palabra);
	        break;
		case 'U':
			c_secun_1_u(palabra);
	        break;
	}
}

void cifrado_secundario_2(char* palabra,char codigo){
	switch (codigo){
	    case 'A':
	        c_secun_2_a(palabra);
	        break;
	    case 'E':
		    c_secun_2_e(palabra);
	        break;
   	    case 'I':
	   	    c_secun_2_i(palabra);
	        break;
		case 'O':
	        c_secun_2_o(palabra);
	        break;
		case 'U':
			c_secun_2_u(palabra);
	        break;
	}
}

char* encriptar(char* palabra,char* codigo,char alfabeto[]){
    char* mensaje_cifrado_final = (char *)malloc(sizeof(char)*(strlen(palabra) + 3));
    
    char* palabra_encript= cifrado_principal(palabra,indiceLetra(codigo[ strlen(codigo) - 1],alfabeto));
    char codigo_c_princ[2] = {codigo[ strlen(codigo) - 1] ,'\0'};
    strcat(mensaje_cifrado_final,codigo_c_princ);
    strcat(mensaje_cifrado_final,"-");
    strcat(mensaje_cifrado_final,palabra_encript);
    
    cifrado_secundario_1(mensaje_cifrado_final,codigo[0]);
    //strcar recibe char*, debemos convertir el char en char* añadiendo el caracter nullo
    char codigo_c_sec_1[2] = {codigo[0],'\0'};
    strcat(mensaje_cifrado_final,"-");
    strcat(mensaje_cifrado_final,codigo_c_sec_1);

    cifrado_secundario_2(mensaje_cifrado_final,codigo[1]);
    char codigo_c_sec_2[2] = {codigo[1],'\0'};

    strcat(mensaje_cifrado_final,"-");
    strcat(mensaje_cifrado_final,codigo_c_sec_2);
    
    return mensaje_cifrado_final;
}

int main(){
    char alfabeto[26];
    generaAlfabeto(alfabeto);

    char cadena_de_caracteres[100];
    printf("Indique el mensaje a encriptar: ");
    scanf("%s", cadena_de_caracteres);
    
    char cadena_de_codigo[100];
    printf("Indique el codigo a usar: ");
    scanf("%s", cadena_de_codigo);
    
    convetirMayusculas(cadena_de_caracteres);
    convetirMayusculas(cadena_de_codigo);
    
    printf("Encriptando..\n");
    char* parcial = encriptar(cadena_de_caracteres,cadena_de_codigo,alfabeto);
    printf("Encriptado con exito,: %s",parcial);
    return 0;
}