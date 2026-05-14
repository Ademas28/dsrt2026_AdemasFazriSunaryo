v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1590 -1450 1590 -1420 {lab=#net1}
N 1590 -1500 1590 -1450 {lab=#net1}
N 1590 -1500 1820 -1500 {lab=#net1}
N 1820 -1500 1820 -1480 {lab=#net1}
N 1760 -1450 1780 -1450 {lab=in}
N 1760 -1450 1760 -1330 {lab=in}
N 1760 -1330 1780 -1330 {lab=in}
N 1720 -1420 1760 -1420 {lab=in}
N 1720 -1270 1820 -1270 {lab=GND}
N 1820 -1300 1820 -1270 {lab=GND}
N 1590 -1270 1720 -1270 {lab=GND}
N 1590 -1360 1590 -1270 {lab=GND}
N 1820 -1500 1870 -1500 {lab=#net1}
N 1870 -1500 1870 -1450 {lab=#net1}
N 1820 -1450 1870 -1450 {lab=#net1}
N 1820 -1420 1820 -1360 {lab=out}
N 1820 -1390 1890 -1390 {lab=out}
N 1820 -1270 1870 -1270 {lab=GND}
N 1870 -1330 1870 -1270 {lab=GND}
N 1820 -1330 1870 -1330 {lab=GND}
N 1720 -1270 1720 -1250 {lab=GND}
N 1700 -1420 1700 -1400 {lab=in}
N 1700 -1420 1720 -1420 {lab=in}
N 1700 -1340 1700 -1270 {lab=GND}
N 1690 -1430 1700 -1430 {lab=in}
N 1700 -1430 1700 -1420 {lab=in}
C {sky130_fd_pr/nfet_01v8.sym} 1800 -1330 0 0 {name=M1
W=6
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1800 -1450 0 0 {name=M2
W=6
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} 1700 -1370 0 0 {name=V1 
*value=0
value = "PULSE(0 1.8 1n 10p 10p 4n 10n)"
savecurrent=false}
C {vsource.sym} 1590 -1390 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} 1690 -1430 0 0 {name=p1 sig_type=std_logic lab=in
}
C {lab_pin.sym} 1890 -1390 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} 1720 -1250 0 0 {name=l1 lab=GND
}
C {code.sym} 1610 -1640 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} 1730 -1690 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
*dc v1 0 1.8 0.01
tran 10ps 10ns
plot in out
op
.endc

"}
