//Proyecto: https://wokwi.com/projects/448504130864664577

#include <stdint.h>
#include <stdio.h>

//definiendo las direcciones de ADC:
#define SENS_SAR_START_FORCE_REG (*(volatile uint32_t *)0x3FF4882C)
#define SENS_SAR_READ_CTRL_REG (*(volatile uint32_t *)0x3FF48800)
#define SENS_SAR_ATTEN1_REG (*(volatile uint32_t *)0x3FF48834)
#define SENS_SAR_MEAS_START1_REG (*(volatile uint32_t *)0x3FF48854)

//definiendo direcciones de w1ts y w1tc
#define GPIO_ENABLE_W1TS_REG (*(volatile uint32_t *)0x3FF44024)
#define LED_B 25
#define LED_G 26
#define LED_R 27
#define SW1 5
#define SW2 4
//PARA INTRODUCIR TMUESTREO
#define ENTER 2
//definiendo registros de alta o baja
#define GPIO_OUT_W1TS_REG (*(volatile uint32_t *)0x3FF44008)
#define GPIO_OUT_W1TC_REG (*(volatile uint32_t *)0x3FF4400C)
#define GPIO_IN_REG (*(volatile uint32_t *)0x3FF4403C)
//definiendo registros de io_mux para 4 y 5
#define IO_MUX_GPIO4_REG (*(volatile uint32_t *)0x3FF49048)
#define IO_MUX_GPIO5_REG (*(volatile uint32_t *)0x3FF4906C)
#define IO_MUX_GPIO2_REG (*(volatile uint32_t *)0x3FF49040)


void adc1_config();
uint32_t adc1_leer();
int tmuestreo = 0;
int arreglo[10];
int bandera = 1;
void setup() {
  //configuración ADC
  adc1_config();
  //declaración de salidas
  GPIO_ENABLE_W1TS_REG |= (1 << LED_B) | (1 << LED_G) | (1 << LED_R);
  //desactivar pull-down y activar pull-up
  IO_MUX_GPIO4_REG &= ~(1 << 7);
  IO_MUX_GPIO4_REG |= (1 << 8);
  IO_MUX_GPIO5_REG &= ~(1 << 7);
  IO_MUX_GPIO5_REG |= (1 << 8);
  IO_MUX_GPIO2_REG &= ~(1 << 7);
  IO_MUX_GPIO2_REG |= (1 << 8);
}

void loop() {

  int pulsador1 = (GPIO_IN_REG & (1 << SW1));
  int pulsador2 = (GPIO_IN_REG & (1 << SW2));
  int pulsadorE = (GPIO_IN_REG & (1 << ENTER));
  delay(500);

  while (bandera){
    //incremento
    if (pulsador1 == 32 && tmuestreo > 2){
      tmuestreo = tmuestreo - 2;

    }
    if (pulsador2 == 16 && tmuestreo < 20){
      tmuestreo = tmuestreo + 2;

    }

    if (tmuestreo >= 2 && tmuestreo <= 10){
      //encender led rojo
      GPIO_OUT_W1TS_REG |= (1 << LED_R);
      GPIO_OUT_W1TC_REG |= (1 << LED_G);
      GPIO_OUT_W1TC_REG |= (1 << LED_B);
    }
    else {
      //encender led azul
      if (tmuestreo >= 12 && tmuestreo <= 16){
        GPIO_OUT_W1TS_REG |= (1 << LED_B);
        GPIO_OUT_W1TC_REG |= (1 << LED_G);
        GPIO_OUT_W1TC_REG |= (1 << LED_R);

      }
      else {
        //encender led verde
        GPIO_OUT_W1TS_REG |= (1 << LED_G);
        GPIO_OUT_W1TC_REG |= (1 << LED_R);
        GPIO_OUT_W1TC_REG |= (1 << LED_B);
      }
    }
    printf("%d \n", tmuestreo);
    delay(500);
  }

  if (pulsadorE == 4){
    bandera = 0;
  }
  
  //tmuestreo definido
  while (bandera == 0){
    //10 ciclos
    int i = 0;
    double suma = 0;
    while (i <= 10){
      arreglo[i] = adc1_leer();
      //precaucion para leer ADC
      if (arreglo[i] < 0){
        printf("Error en ADC");

      }
      else{
        suma = suma + arreglo[i];
      }
      delay(tmuestreo * 1000);
      i++;
    }
    //calcular promedio
    double prom = suma / 10;
    //apagar led
    GPIO_OUT_W1TC_REG |= (1 << LED_G);
    GPIO_OUT_W1TC_REG |= (1 << LED_R);
    GPIO_OUT_W1TC_REG |= (1 << LED_B);

    //imprimir promedio y tiempo de muestreo
    printf("El promedio fue: %lf \n", prom);
    printf("El tiempo de muestreo fue: %i \n", tmuestreo);
    //reset
    bandera = 1;
  }
}

void adc1_config(){
  //asignar 1 a ATTEN1 -CH6
  SENS_SAR_ATTEN1_REG |= (0X3 << 12);
  //asgnar 1 a bit dig_force para el control digital
  SENS_SAR_READ_CTRL_REG |= (1 << 27);
  //resolución de 12 bits:
  SENS_SAR_READ_CTRL_REG |= (0x3 << 16);

  //ancho de banda de 12 bits
  SENS_SAR_START_FORCE_REG |= (0x3 << 0);
}

uint32_t adc1_leer(){
  //habilitación de ADC y PAD
  SENS_SAR_MEAS_START1_REG |= (1 << 31) | (1 << 25) | (1 << 18) | (1 << 17);
  uint32_t timeout = 10000000;
  //esperar al bit done = 1
  while ((SENS_SAR_MEAS_START1_REG & (1 << 16)) == 0){
    timeout --;
    if (timeout == 0){
      return -1;
    }
  }
  return uint32_t (SENS_SAR_MEAS_START1_REG & 0xFFFF);
}