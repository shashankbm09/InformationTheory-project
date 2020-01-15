clc;
close all;
clear all;
M = 2;			%No of transmit antenna

SNRdB = [0:25];
SNR = 10.^(SNRdB/10);

H_2x1 = (randn(1,M)+j*randn(1,M))/sqrt(2);
H_2x2 = (randn(2,M)+j*randn(2,M))/sqrt(2);

for K = 1:length(SNR)
C_ostbc_2x1(K) = log2(1+ SNR(K)*norm(H_2x1)^2/M);
C_2x2(K) = log2(abs(det(eye(2)+SNR(K)*H_2x2*H_2x2'/M)));
C_2x1(K) = log2(abs(det(eye(1)+SNR(K)*H_2x1*H_2x1'/M)));
C_ostbc_2x2(K) = (log2(1+SNR(K)*norm(H_2x2)^2/M));
end

plot(SNRdB,C_ostbc_2x1,'r o',SNRdB,C_ostbc_2x2,'b - *',SNRdB,C_2x1,'m',SNRdB,C_2x2,'k - .')
legend('C_2_x_1OSTBC','C_2_x_2OSTBC','C_2_x_1E','C_2_x_2E',4)
xlabel('SNR in dB')
ylabel('Capacity bits per channel')
title('Capacity Vs. SNR')
grid;