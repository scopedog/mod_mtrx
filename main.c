#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <sys/time.h>
#include "util.h"
#include "mod_mtrx.h"

// Main
int
main(int argc, char **argv)
{
	// Test matrix and vector calculation with 2^32 modular arithmetic
	Mod32TestMtrx(); // 32-bit

	exit(0);
}
