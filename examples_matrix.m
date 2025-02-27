%% Matrix Operations
% 1. Creating and Displaying a Matrix

A = [1 2 3; 4 5 6; 7 8 9];
disp('Matrix A:');
disp(A);


% 2. Adding and Subtracting Matrices

A = [1 2; 3 4];
B = [5 6; 7 8];

C_add = A + B;      % Matrix addition
C_sub = A - B;      % Matrix subtraction

disp('A + B =');
disp(C_add);
disp('A - B =');
disp(C_sub);


% 3. Element-wise and Matrix Multiplication

A = [1 2; 3 4];
B = [2 2; 2 2];

C_elem = A .* B;    % Element-wise multiplication
C_mat  = A * B;     % Matrix multiplication

disp('Element-wise multiplication A .* B =');
disp(C_elem);
disp('Matrix multiplication A * B =');
disp(C_mat);


% 4. Transpose of a Matrix

A = [1 2 3; 4 5 6];
A_trans = A';

disp('Matrix A:');
disp(A);
disp('Transpose of A:');
disp(A_trans);


% 5. Accessing Matrix Elements and Submatrices

A = [10 20 30; 40 50 60; 70 80 90];

element_1_2 = A(1,2);    % Element in row 1, col 2
second_row = A(2, :);    % Entire second row
sub_matrix = A(1:2, 2:3);% Rows 1-2, Columns 2-3

disp(['Element at (1,2): ' num2str(element_1_2)]);
disp('Second row:');
disp(second_row);
disp('Submatrix of A:');
disp(sub_matrix);


% 6. Reshaping a Matrix

A = [1 2 3 4 5 6];
B = reshape(A, 2, 3);  % Reshape into 2 rows, 3 columns

disp('Original vector A:');
disp(A);
disp('Reshaped matrix B (2x3):');
disp(B);


% 7. Logical Indexing

A = [3 6 2 10 5];
mask = (A > 5);      % Logical condition
greater_than_five = A(mask);

disp('Original A:');
disp(A);
disp('Logical mask (A > 5):');
disp(mask);
disp('Elements of A greater than 5:');
disp(greater_than_five);



% 8. Finding Elements in a Matrix

A = [1 4 7; 2 4 6; 3 4 5];
[row_idx, col_idx] = find(A == 4);

disp('Matrix A:');
disp(A);
disp('Locations where A = 4:');
disp('Row indices:');
disp(row_idx);
disp('Column indices:');
disp(col_idx);



% 9. Concatenation of Matrices

A = [1 2; 3 4];
B = [5 6; 7 8];

H = [A, B];  % Horizontal concatenation
V = [A; B];  % Vertical concatenation

disp('Matrix A:');
disp(A);
disp('Matrix B:');
disp(B);
disp('Horizontal concatenation [A, B]:');
disp(H);
disp('Vertical concatenation [A; B]:');
disp(V);



% 10. Inverse and Determinant

A = [2 1; 1 2];
A_inv = inv(A);   % Inverse of A
A_det = det(A);   % Determinant of A

disp('Matrix A:');
disp(A);
disp('Inverse of A:');
disp(A_inv);
disp(['Determinant of A is: ' num2str(A_det)]);
