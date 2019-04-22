functions {
    // log(xi_k / C)
    real log_xi(int k, int D, real lambda, real theta) {
        real D1 = D + 1;
        real D2 = D + theta;
        return -log(k) + k * log(lambda)
            + lgamma(D1) + lgamma(D2 - k) - lgamma(D1 - k) - lgamma(D2);
    }
}
data {
    /* Number of cultural elements */
    int<lower=1> M;
    /* Popularity of each cultural element */
    int<lower=1> K[M];
    /* Number of demes, given by the maximum of popularity in the data */
    int<lower=1> D;
}
parameters {
    real<lower=1> lambda;
    real<lower=0> theta;

}
transformed parameters {
    real<lower=0,upper=1> beta;
    real<lower=0> eta_;  // eta'
    beta = (D - 1) / (D - 1 + theta);
    eta_ = beta * (lambda - 1);
}
model {
    real Z = 0;
    lambda ~ cauchy(1, 5);
    theta ~ cauchy(0, 5);
    for (i in 1:M)
        target += log_xi(K[i], D, lambda, theta);
    for (k in 1:D)
        Z += exp(log_xi(k, D, lambda, theta));
    target += - M * log(Z);
}
