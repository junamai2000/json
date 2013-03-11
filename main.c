#include <stdio.h>
#include "json.h"

int main(int argc, char **argv) {
	FILE *fp = stdin;
	JSONValue *json;

	if (argc >= 2) {
		if (!(fp = fopen(argv[1], "r"))) {
			fprintf(stderr, "File [%s] is not found!\n", argv[1]);
			return 1;
		}
	}

	if ((json = json_parser(fp))) {
		json_print(stdout, json);
	} else {
		printf("Json error!\n");
	}

	return 0;
}
