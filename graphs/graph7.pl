% IB013 Logic Programming
% project 4 (Dynamic graph 2)
% Andrej Krejcir (xkrejcir), Martin Ukrop (xukrop), Vladimir Still (xstill)
% developed using SICStus Prolog 4.2.3
%
% incorrect graph (multiple edges between same node exist at one moment)

name('graph7').
e(a,b,2013-05-10+20:00,60).
e(a,b,2013-05-10+21:00,30).
e(b,c,2013-05-10+20:00,30).
e(b,c,2013-05-10+20:01,31).
