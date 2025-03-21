clc; clear; close all;

% Definición de la función f(x) y su derivada
f = @(x) exp(-x) - x;
df = @(x) -exp(-x) - 1; % Derivada de f(x)

% Parámetros
x0 = 0; % Valor inicial
tol = 1e-6; % Tolerancia
max_iter = 100; % Número máximo de iteraciones

%% Método de Punto Fijo
g = @(x) exp(-x); % Función de iteración para punto fijo
x = x0;
iter = 0;
while iter < max_iter
    x_next = g(x);
    if abs(x_next - x) < tol
        break;
    end
    x = x_next;
    iter = iter + 1;
end
fprintf('Método de Punto Fijo: x = %.6f en %d iteraciones\n', x, iter);

%% Método de Newton-Raphson
x = x0;
iter = 0;
while iter < max_iter
    x_next = x - f(x) / df(x);
    if abs(x_next - x) < tol
        break;
    end
    x = x_next;
    iter = iter + 1;
end
fprintf('Método de Newton-Raphson: x = %.6f en %d iteraciones\n', x, iter);
