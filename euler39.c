#include <math.h>
#include <stdio.h>

int do_stuff(double p) {
    int res = 0;
    double a, b, c = 0.0;
    for (a = 0.0; a < (p / 2); a++) {
	for (b = 0.0; b < a; b++) {
	    c = sqrt(pow(a,2.0) + pow(b,2.0));
	    if ((a + b + c) == p) {
		res++;
	    }
	}
    }

    return res;
}


int main () {
    int ans = 0, perim = 1, tmp = 0, x;
    for (x = 0; x <= 1000; x++) {
	tmp = do_stuff(x);
	if (ans < tmp) {
	    ans = tmp;
	    perim = x;
	}
    }
    printf("%d\n", ans);
    printf("%d\n", perim);

    return 0;
}
