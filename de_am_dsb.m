function [m_demod, s_demod] = de_am_dsb(s, fm, fc, fs, Ac, mu, t)
    c_demod = cos(2 * pi * fc * t);
    % Nhân tín hiệu với sóng mang để đưa về tần số thấp
    s_demod = s .* c_demod;
    % Tạo bộ lọc thông thấp Butterworth
    Wn = fm / (fs / 2); % Chuẩn hóa tần số cắt
    [b, a] = butter(5, Wn); % Bộ lọc thông thấp bậc 5

    % Lọc thông thấp để lấy lại tín hiệu thông tin
    m_demod = filtfilt(b, a, s_demod);
    m_demod = m_demod - mean(m_demod);
    scaling_factor = 2 / (Ac * mu); % Hệ số khôi phục biên độ
    m_demod = m_demod * scaling_factor;
end