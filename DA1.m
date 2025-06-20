clc
clear all
close all

Ac = 1;
fm = 5e3;   % f trung tan 5k
fc = 455e3;       % f tin tuc 455k
fs = 5e6;       % >= 2fmax
mu = 1;       % he so dieu che 
duration = 5e-3;  % thoi gian cua tin hieu tin tuc 


[ t , s , fft_s , f , m , c ] = am_dsb( Ac , fc , fs , fm , mu , duration );

figure

subplot(3,1,1)
plot(t, m)
axis([0 5e-3 -1.5 1.5])
title("Tin hiệu sóng mang")
xlabel("Thời gian (s)")
ylabel("Biên độ")

subplot(3,1,2)
plot(t, s)
axis([0 5e-4 -Ac*2 Ac*2])
title("Tín hiệu AM-DSB")
xlabel("Thời gian (s)")
ylabel("Biên độ")

subplot(3,1,3)
plot(f,fft_s)
axis([455e3 - 10e3 , 455e3 + 10e3 , 0 , max(fft_s)])
title("Tín hiệu AM-DSB trong fft")
xlabel("f")
grid("on")

[m_demod, s_demod] = de_am_dsb(s, fm, fc , fs, Ac, mu , t );

figure

subplot(1,1,1)
plot(t, m_demod)
axis([0 5e-4 -Ac*2 Ac*2])
title("Tín hiệu tin tức")
xlabel("Thời gian (s)")
ylabel("Biên độ")
