function [ t , s , fft_s , f , m , c ] = am_dsb( Ac , fc , fs , fm , mu , duration )
%AM_DSB Summary of this function goes here
t = 0:1/fs:duration;              % Tạo thời gian ban đầu 
m = cos(2 * pi * fm * t );
t = (0:length(m)-1) / fs;         % Tạo chuỗn thời gian theo tín hiệu tin tức 
c = cos(2 * pi * fc * t);         % Tín hiệu sóng mang trung tần
s = Ac * ( 1 + mu * m).* c;       % Chập 2 tín hiệu lại 
N = length(s);                    % Số điểm FFT
fft_s = abs(fftshift(fft(s, N))); % Lấy trị tuyệt đối sau khi shift
f = (-N/2:N/2-1)*(fs/N);          % Trục tần số
%   Detailed explanation goes here
end
