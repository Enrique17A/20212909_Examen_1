#include <stdint.h>

//Definiendo la dirección base
#define GPIO0_BASE 0x50000000
//Definiendo los offset
#define OUT (GPIO0_BASE + 0x504)
#define OUTSET (GPIO0_BASE + 0x508)
#define OUTCLR (GPIO0_BASE + 0x50C)
#define IN (GPIO0_BASE + 0x510)
#define DIR (GPIO0_BASE + 0x514)
#define DIRSET (GPIO0_BASE + 0x518)
#define DIRCLR (GPIO0_BASE + 0x51C)

int main(){
    //Creando los punteros
    //Se usa uint32_t porque los registros son de 32 bits
    volatile uint32_t *out_dir = (uint32_t *) OUT;
    volatile uint32_t *outset_dir = (uint32_t *) OUTSET;
    volatile uint32_t *outclr_dir = (uint32_t *) OUTCLR;
    volatile uint32_t *in_dir = (uint32_t *) IN;
    volatile uint32_t *dir_dir = (uint32_t *) DIR;
    volatile uint32_t *dirset_dir = (uint32_t *) DIRSET;
    volatile uint32_t *dirclr_dir = (uint32_t *) DIRCLR;

    return 0;
}
