%% Loop
% 1. Using the 'for' Loop with Vectors

v = [1, 2, 3, 4, 5];
sum_v = 0;

for i = 1:length(v)
    sum_v = sum_v + v(i);
end

disp(['Sum of vector v is: ' num2str(sum_v)]);



% 2. Building a Matrix in a 'for' Loop

n = 5;
M = zeros(n,n);  % Pre-allocate for efficiency

for i = 1:n
    for j = 1:n
        M(i,j) = i + j;
    end
end

disp('Matrix M built using a nested for loop:');
disp(M);



% 3. Summation of Matrix Rows in a Loop

A = randi(10, 4, 4);  % 4x4 matrix with random integers from 1 to 10
row_sums = zeros(1, size(A,1));

for i = 1:size(A,1)
    row_sums(i) = sum(A(i,:));
end

disp('Matrix A:');
disp(A);
disp('Sum of each row of A:');
disp(row_sums);


% 4. While Loop Example

count = 0;
limit = 5;

while count < limit
    count = count - 1;
    disp(['Count is: ' num2str(count)]);
end

disp('While loop ended.');


% 5. If - break in a Loop

A = [2 4 6 8 10];
for i = 1:length(A)
    if A(i) > 6
        disp(['Value ' num2str(A(i)) ' is greater than 6. Breaking out of loop.']);
        break;  % Exit the for loop
    end
    disp(['Value ' num2str(A(i)) ' is not greater than 6.']);
end


% 6. If - continue in a Loop

A = [3 5 7 2 9];
for i = 1:length(A)
    if A(i) < 5
        continue;  % Skip the rest of the loop body if condition met
    end
    disp(['Value ' num2str(A(i)) ' is >= 5.']);
end



