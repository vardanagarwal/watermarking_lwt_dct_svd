folder ='C:\Users\hp\Desktop\project on watermarking\comparison_plots\tables.xls';

% % jpeg
x = [70, 50, 40, 30, 20, 10, 5];
our = [0.9997, 0.9996, 0.9996, 0.9995, 0.9994, 0.9993, 0.9992];
one = [0.9940, 0.9900, 0.9880, 0.9870, 0.9830, 0.9720, 0.9520];
two = [0.9990, 0.9990, 0.9990, 0.9980, 0.9980, 0.9950, 0.9860];
createfigure(x, our, one, two, 0, 75, 'JPEG')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A1:D6');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('jpeg commpression');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% % salt & pepper noise
x = [0.001, 0.005, 0.01, 0.1, 0.3, 0.5];
our = [0.9997, 0.9988, 0.9966, 0.9163, 0.6519, 0.4238];
one = [0.9750, 0.9940, 0.9510, 0.7830, 0.6650, 0.6320];
two = [0.9950, 0.9810, 0.9710, 0.8460, 0.6800, 0.5870];
createfigure(x, our, one, two, 0, 0.55, 'Salt and Pepper Noise')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A8:D13');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('salt and pepper noise');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% speckle noise
x = [0.001, 0.005, 0.01, 0.1, 0.3, 0.5];
our = [0.9997, 0.9987, 0.9969, 0.9379, 0.7844, 0.6849];
one = [0.9720, 0.9930, 0.9510, 0.8100, 0.7190, 0.6900];
two = [0.9940, 0.9800, 0.9720, 0.8740, 0.7560, 0.7020];
createfigure(x, our, one, two, 0, 0.55, 'Speckle Noise')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A15:D20');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('speckle noise');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% % gaussian noise
x = [0.001, 0.005, 0.01, 0.1, 0.3, 0.5];
our = [0.9841, 0.9840, 0.9844, 0.9654, 0.8429, 0.6349];
one = [0.9790, 0.9240, 0.8780, 0.7050, 0.6520, 0.6380];
two = [0.9820, 0.9800, 0.9720, 0.8740, 0.7560, 0.7020];
createfigure(x, our, one, two, 0, 0.55, 'Gaussian Noise')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A22:D27');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('gaussian noise');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% %translation attack
x = [1, 2, 3, 4, 5, 6];
our = [0.9995, 0.9992, 0.9956, 0.9872, 0.9879, 0.9831];
one = [0.9940, 0.9910, 0.9890, 0.9870, 0.9860, 0.9820];
two = [0.9940, 0.9900, 0.9850, 0.9740, 0.9740, 0.9750];
createfigure(x, our, one, two, 0.5, 6.5, 'Translation')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A29:D34');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('translation coordinates');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% %scaling attack
x = [1, 2, 3, 4, 5, 6];
our = [0.9009, 0.9735, 0.9974, 0.9998, 0.9999, 0.9999];
one = [0.5660, 0.7880, 0.9480, 0.9920, 0.9930, 0.9930];
two = [0.7570, 0.8980, 0.9840, 0.9980, 0.9980, 0.9980];
createfigure(x, our, one, two, 0.5, 6.5, 'Scaling')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A36:D41');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('scaling');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% %cut attack
x = [1, 2, 3, 4, 5, 6];
our = [0.9998, 0.9998, 0.9995, 0.9995, 0.9991, 0.9990];
one = [0.9940, 0.9930, 0.9890, 0.9920, 0.9860, 0.9890];
two = [0.9950, 0.9890, 0.9910, 0.9840, 0.9850, 0.9840];
createfigure(x, our, one, two, 0.5, 6.5, 'Cut Attack')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A43:D48');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('cut');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% %median filter attack
x = [2, 3, 5, 7, 9, 11];
our = [0.9978, 0.9925, 0.9735, 0.9466, 0.9163, 0.8845];
one = [0.9890, 0.9820, 0.9500, 0.9140, 0.8820, 0.8560];
two = [0.9920, 0.9890, 0.9710, 0.9510, 0.9330, 0.9150];
createfigure(x, our, one, two, 1, 12, 'Filter Size')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A50:D55');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('median filter');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');
% figure
% 
% %gaussian filter attack
x = [2, 3, 5, 7, 9, 11];
our = [0.9978, 0.9927, 0.9743, 0.9481, 0.9185, 0.8873];
one = [0.9800, 0.9870, 0.9870, 0.9870, 0.9870, 0.9870];
two = [0.9890, 0.9910, 0.9910, 0.9910, 0.9910, 0.9910];
createfigure(x, our, one, two, 1, 12, 'Filter Size')
a = [x;our;one;two];
a = a';
xlswrite(folder, a, 'A57:D62');
% plot(x, our,'*-r', x, one, '*-b', x, two,'*-g');
% xlabel('gaussian filter');ylabel('NC');
% legend('Location', 'northoutside');
% legend('Orientation','horizontal')
% legend('Proposed', 'rdwt-svd', 'iwt-svd');