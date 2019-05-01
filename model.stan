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
    /* Size of popularity-frequency table */
    int<lower=1> l;
    /* Popularities */
    int<lower=1> k[l];
    /* Frequencies */
    int<lower=1> m[l];
    /* Number of demes, given by the number of sites or groups */
    int<lower=1> D;
}
parameters {
    real<lower=1> lambda;
    real<lower=0> theta;
}
model {
    real Z = 0;
    lambda ~ cauchy(1, 5);
    theta ~ cauchy(0, 5);
    for (i in 1:l)
        target += m[i] * log_xi(k[i], D, lambda, theta);
    for (k_ in 1:D)
        Z += exp(log_xi(k_, D, lambda, theta));
    target += - sum(m) * log(Z);
}
generated quantities {
    real<lower=0,upper=1> beta;
    real<lower=0> eta_;  // eta'
    real<lower=0> beta_plus_eta_;
    beta = (D - 1) / (D - 1 + theta);
    eta_ = beta * (lambda - 1);
    beta_plus_eta_ = beta + eta_;
}
