# trace the seven segment value
when {/counter/cout} {set ss [exa -bin {/counter/cout}]}

# set ss "0000000"

set flag_ss 0

# Resize the entire canvas by a scale 
proc rescale {cvn factor} {
	global SCALE
	
	# rescale all the boxes 
	$cvn scale all 0 0 $factor $factor
	
	# rescale the text widths, too
	foreach i [$cvn find all] {
		if {[expr ! [string compare "text" [$cvn type $i]]]} {
			set t [$cvn itemcget $i -width]
			set t [expr $t * $factor]
			$cvn itemconfigure $i -width $t
		}
	}
	
	# resize the canvas itself 
	set t [$cvn cget -width]
	$cvn configure -width [expr $t * $factor]
	set t [$cvn cget -height]
	$cvn configure -height [expr $t * $factor]
}	

catch {destroy .sevenseg}
set ss_w [toplevel .sevenseg]

set fr1 [frame $ss_w.fr1]
set fr2 [frame $ss_w.fr2]

set ss_cv [canvas $fr1.ss_cv -height 20 -width 10]

$ss_cv create text 1 1 -anchor nw -fill black -text "SEVEN SEG" -width 15

set ss_a [$ss_cv create line 3 5 7 5 -fill gray -width 0] 
set ss_b [$ss_cv create line 7 6 7 10 -fill gray -width 0]
set ss_c [$ss_cv create line 7 12 7 16 -fill gray -width 0]
set ss_d [$ss_cv create line 7 17 3 17 -fill gray -width 0]
set ss_e [$ss_cv create line 3 16 3 12 -fill gray -width 0]
set ss_f [$ss_cv create line 3 10 3 6 -fill gray -width 0]
set ss_g [$ss_cv create line 4 11 6 11 -fill gray -width 0]
button $fr2.close -text "Close" -command {destroy .sevenseg; set flag_ss 0}

rescale $ss_cv 8
# indicate the existence of seven segment window
set flag_ss 1

# call the ss_monitor procedure with dummy parameters 
# I am calling this function bcos if user invokes the seven segment after the value is written 
# to it, then ss_monitor procedure is not called and seven segment LEDS remain inactive
# ss_monitor 1 2 3

pack $ss_cv
pack $fr2.close
pack $fr1
pack $fr2


trace variable ss w ss_monitor

proc ss_monitor {name arrayindex op} {
	global flag_ss ss_a ss_b ss_c ss_d ss_e ss_f ss_g ss ss_cv
	if {$flag_ss==1} {
		if {[string index $ss 0]==1} {
			$ss_cv itemconfigure $ss_a -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_a -fill gray -width 0
		}
		if {[string index $ss 1]==1} {
			$ss_cv itemconfigure $ss_b -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_b -fill gray -width 0
		}
		if {[string index $ss 2]==1} {
			$ss_cv itemconfigure $ss_c -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_c -fill gray -width 0
		}
		if {[string index $ss 3]==1} {
			$ss_cv itemconfigure $ss_d -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_d -fill gray -width 0
		}
		if {[string index $ss 4]==1} {
			$ss_cv itemconfigure $ss_e -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_e -fill gray -width 0
		}
		if {[string index $ss 5]==1} {
			$ss_cv itemconfigure $ss_f -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_f -fill gray -width 0
		}
		if {[string index $ss 6]==1} {
			$ss_cv itemconfigure $ss_g -fill blue -width 3
		} else {
			$ss_cv itemconfigure $ss_g -fill gray -width 0
		}
	}
}
