v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1910 -1440 1910 -1410 {lab=#net1}
N 1910 -1490 1910 -1440 {lab=#net1}
N 1910 -1490 2140 -1490 {lab=#net1}
N 2140 -1490 2140 -1470 {lab=#net1}
N 2080 -1440 2100 -1440 {lab=in}
N 2080 -1440 2080 -1320 {lab=in}
N 2080 -1320 2100 -1320 {lab=in}
N 2040 -1410 2080 -1410 {lab=in}
N 2040 -1260 2140 -1260 {lab=GND}
N 2140 -1290 2140 -1260 {lab=GND}
N 1910 -1260 2040 -1260 {lab=GND}
N 1910 -1350 1910 -1260 {lab=GND}
N 2140 -1490 2190 -1490 {lab=#net1}
N 2190 -1490 2190 -1440 {lab=#net1}
N 2140 -1440 2190 -1440 {lab=#net1}
N 2140 -1410 2140 -1350 {lab=out}
N 2140 -1380 2210 -1380 {lab=out}
N 2140 -1260 2190 -1260 {lab=GND}
N 2190 -1320 2190 -1260 {lab=GND}
N 2140 -1320 2190 -1320 {lab=GND}
N 2040 -1260 2040 -1240 {lab=GND}
N 2020 -1410 2020 -1390 {lab=in}
N 2020 -1410 2040 -1410 {lab=in}
N 2020 -1330 2020 -1260 {lab=GND}
N 2010 -1420 2020 -1420 {lab=in}
N 2020 -1420 2020 -1410 {lab=in}
C {sky130_fd_pr/nfet_01v8.sym} 2120 -1320 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 2120 -1440 0 0 {name=M2
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
C {vsource.sym} 2020 -1360 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} 1910 -1380 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} 2010 -1420 0 0 {name=p1 sig_type=std_logic lab=in
}
C {lab_pin.sym} 2210 -1380 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} 2040 -1240 0 0 {name=l1 lab=GND
}
C {code.sym} 1610 -1640 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} 1730 -1640 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v1 0 1.8 0.01
plot in out
op
.endc

"}
