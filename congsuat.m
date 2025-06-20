clc;
clear all;
close all;

% Khởi tạo tham số
Ac = 1;
fm = 5e3;        % Tần số tin tức (5 kHz)
fc = 455e3;      % Tần số sóng mang (455 kHz)
fs = 5e6;        % Tần số lấy mẫu (5 MHz)
mu = 1;          % Hệ số điều chế (100%)
duration = 5e-3; % Thời gian tín hiệu (5 ms)

% Tạo tín hiệu AM-DSB
[ t , s , fft_s , f , m , c ] = am_dsb(Ac, fc, fs, fm, mu, duration);

% Tính công suất tín hiệu tin tức
P_m = mean(m.^2); % Công suất trung bình của tín hiệu tin tức
fprintf('Công suất tín hiệu tin tức: %.4f W\n', P_m);

% Tính công suất tín hiệu AM-DSB lý thuyết
P_AM_DSB_theory = (Ac^2 / 2) * (1 + (mu^2 / 2));
fprintf('Công suất AM-DSB lý thuyết: %.4f W\n', P_AM_DSB_theory);

% Tính công suất AM-DSB từ dữ liệu mẫu
P_AM_DSB_calculated = mean(s.^2);
fprintf('Công suất AM-DSB tính từ tín hiệu: %.4f W\n', P_AM_DSB_calculated);

% Hiển thị tín hiệu tin tức và AM-DSB
figure;

subplot(3,1,1);
plot(t, m);
axis([0 5e-3 -1.5 1.5]);
title("Tín hiệu thông tin");
xlabel("Thời gian (s)");
ylabel("Biên độ");

subplot(3,1,2);
plot(t, s);
axis([0 5e-4 -Ac*2 Ac*2]);
title("Tín hiệu AM-DSB");
xlabel("Thời gian (s)");
ylabel("Biên độ");

subplot(3,1,3);
plot(f, fft_s);
axis([455e3 - 10e3, 455e3 + 10e3, 0, max(fft_s)]);
title("Phổ tín hiệu AM-DSB");
xlabel("Tần số (Hz)");
grid("on");
