// MATLAB: No grammar defined in vscode

% Define variables
a = 10;
b = 5;

% Arithmetic Operators
sum_result = a + b;
diff_result = a - b;
prod_result = a * b;
quot_result = a / b;
mod_result = mod(a, b);

disp(['Sum: ', num2str(sum_result), ', Difference: ', num2str(diff_result)]);
disp(['Product: ', num2str(prod_result), ', Quotient: ', num2str(quot_result), ', Modulus: ', num2str(mod_result)]);

% Logical Operations
x = true;
y = false;
disp(['AND: ', num2str(x && y), ', OR: ', num2str(x || y), ', NOT: ', num2str(~x)]);

% Conditional Statements
if a > b
    disp('a is greater than b');
elseif a == b
    disp('a is equal to b');
else
    disp('a is less than b');
end

% Loops
for i = 1:5
    disp(['Loop iteration: ', num2str(i)]);
end

% While Loop
n = 1;
while n <= 3
    disp(['While loop iteration: ', num2str(n)]);
    n = n + 1;
end

% Function Definition
function output = squareNumber(x)
    output = x^2;
end

% Calling function
disp(['Square of 4: ', num2str(squareNumber(4))]);

% Matrix Operations
A = [1 2; 3 4];
B = [5 6; 7 8];
C = A + B; % Matrix Addition
D = A * B; % Matrix Multiplication
disp('Matrix Addition:');
disp(C);
disp('Matrix Multiplication:');
disp(D);

% Plotting Graph
x = linspace(0, 10, 100);
y = sin(x);
figure;
plot(x, y);
title('Sine Wave');
xlabel('x-axis');
ylabel('y-axis');
grid on;
