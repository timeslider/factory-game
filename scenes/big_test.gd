extends Control
#var mantissa = 1209000.0
#var exponent = 9223372036854775807

# List of things I've fixed
# Renamed all functions in accordance with godot standards
# _typeCheck -> _type_check
# _sizeCheck -> _size_check
# roundDown -> round_down
# minValue -> min_value
# maxValue -> max_value
# plusEquals -> plus_equals
# minusEquals -> minus_equals
# multiplyEquals -> multiply_equals
# divideEquals -> divide_equals
# modEquals -> mod_equals
# powerEquals -> power_equals
# squareRoot -> square_root
# isEqualTo -> is_equal_to
# isGreaterThan -> is_greater_than
# isGreaterThanOrEqualTo -> is_greater_than_or_equal_to
# isLessThan -> is_less_than
# isLessThanOrEqualTo -> is_less_than_or_equal_to
# log10 -> log_10
# absLog10 -> abs_log_10
# logN -> log_n
# pow10 -> pow_10
# setThousandName -> set_thousand_name
# setThousandSeparator -> set_thousand_separator
# setDecimalSeparator -> set_decimal_separator
# setSuffixSeparator -> set_suffix_separator
# setReadingSeparator -> set_reading_separator
# setDynamicDecimals -> set_dynamic_decimals
# setDynamicNumbers -> set_dynamic_numbers
# setMaximumTrailingZeroes -> set_maximum_trailing_zeroes
# setSmallDecimals -> set_small_decimals
# setThousandDecimals -> set_thousand_decimals
# setBigDecimals -> set_big_decimals
# setScientificDecimals -> set_scientific_decimals
# setLogarithmicDecimals -> set_logarithmic_decimals
# toString -> to_big_string NOTE: Added big to avoid confusion with the built-in to_string() method
# toPlainScientific -> to_plain_scientific
# toScientific -> to_scientific
# toLogarithmic -> to_logarithmic
# formatExponent -> format_exponent
# toFloat -> to_float
# toPrefix -> to_prefix
# _latinPower -> _latin_power
# _latinPrefix -> _latin_prefix
# _tillionOrIllion -> _tillion_or_illion
# _llionOrLliard -> _llion_or_lliard
# getLongName -> get_long_name
# toAmericanName -> to_american_name
# toEuropeanName -> to_european_name
# toLongName -> to_long_name
# toMetricSymbol -> to_metric_symbol
# toMetricName -> to_metric_name
# toAA -> to_aa
# Fixed this wiki link, I guess the page has been renamed and the URL BBC code was broken
# _type_check doesn't need to store the result. Speed increase: Negalable. Compliar might optimize.

# normalized, changed snapped to snappedf
# normalized, move the if big.mantissa == 0.0 check to the top of the function
# and added a return to break out as soon as possible. Speed increase: about 1.8

# add_new
# Added types hints to the parameters
# Converted everything into a one-liner: This results in a 3x speed up
# The elif statement seems to not matter. Will need to do more testing

# times
# Most of the inter logic was just normalizing the result and then it was being
# Normalized again. 

# division
# Similar fixed to times

# to_scientific
# Removed this line if split.size() == 1: split.append("") since in version 4.x
# always represents floats with a decimal point





@onready var label: Label = $VBoxContainer/Label

@onready var button: Button = $VBoxContainer/Button
@onready var button_2: Button = $VBoxContainer/Button2
@onready var button_3: Button = $VBoxContainer/Button3
@onready var button_4: Button = $VBoxContainer/Button4
@onready var button_5: Button = $VBoxContainer/Button5
@onready var button_6: Button = $VBoxContainer/Button6
@onready var button_7: Button = $VBoxContainer/Button7
@onready var button_8: Button = $VBoxContainer/Button8
@onready var button_9: Button = $VBoxContainer/Button9
@onready var button_10: Button = $VBoxContainer/Button10

var test_big: Big = Big.new()

func _ready() -> void:
	button.pressed.connect(_on_button_pressed.bind(int(button.text)))
	button_2.pressed.connect(_on_button_pressed.bind(int(button_2.text)))
	button_3.pressed.connect(_on_button_pressed.bind(int(button_3.text)))
	button_4.pressed.connect(_on_button_pressed.bind(int(button_4.text)))
	button_5.pressed.connect(_on_button_pressed.bind(int(button_5.text)))
	button_6.pressed.connect(_on_button_pressed.bind(int(button_6.text)))
	button_7.pressed.connect(_on_button_pressed.bind(int(button_7.text)))
	button_8.pressed.connect(_on_button_pressed.bind(int(button_8.text)))
	button_9.pressed.connect(_on_button_pressed.bind(int(button_9.text)))
	button_10.pressed.connect(_on_button_pressed.bind(int(button_10.text)))
	# Used for speed test comparisons
	var iterations = 100_000

	#var a: Big = Big.new(0)
	#var b: Big = Big.new(0)
	#a.normalize()
	#region _init
	## Test _init()
	## Makes sure mantissa and exponent are set right
	#assert(a.mantissa == 0.0, "The mantissa was not 0.0")
	#assert(a.exponent == 0, "The exponent was not 0")
#
#
	## Test static func _type_check(n) -> Big:
	## a was a big
	#assert(Big._type_check(a) is Big)
	## a was not a big
	##a = 0
	#assert(Big._type_check(0) is Big) # NOTE: It should still return a Big
	#endregion
	
	
	#region _init_log10_table
	# Need to check carefully around powers of 10 (1, 10, 100, 1000...)
	#Big._init_log10_table()
	#endregion
	
	
	#region _type_check
	#print("Testing _type_check")
	#time_callable(Big._type_check_new.bind(a), iterations)
	#time_callable(Big._type_check.bind(a), iterations)
	#endregion
	
	
	#region _size_check
	#endregion
	
	
	#region normalize
	#a = Big.new(0.0, 10)
	#time_callable(Big.normalize.bind(a), iterations)
	#time_callable(Big.normalize_new.bind(a), iterations)
	#endregion
	
	
	#region normalize_new
	#endregion
	
	
	#region absolute
	## Testing absolute
	#a = Big.new(-125.0, 4)
	#print(a.to_big_string())
	#a = Big.absolute(a)
	#print(a.to_big_string())
	#
	## Testing absolute_new
	#a = Big.new(-125.0, 4)
	#print(a.to_big_string())
	#a = Big.absolute_new(a)
	#print(a.to_big_string())
	#endregion
	
	
	#region add
	#a = Big.new(3)
	#b = Big.new(5)
	#print(Big.add(3, 5).to_big_string())
	#print(Big.add_new(a, b).to_big_string())
	#print(Big.add(1234, 1111).to_big_string())
	#print(Big.add_new(Big.new(1234, 0), Big.new(1111, 0)).to_big_string())
	##print(Big.add_new_2(Big.new(5.0, 250), Big.new(3.0, 0)).to_big_string())
	#
	##print(Big.add_new(Big.new(5, 0), Big.new(3, 1000)).to_scientific())
	#time_callable(Big.add.bind(1234, 1111), iterations)
	#time_callable(Big.add_new.bind(Big.new(1234, 0), Big.new(1111, 0)), iterations) # 3.14 times faster
	#endregion
	
	
	#region add_new
	#endregion
	
	
	#region subtract
	#time_callable(Big.subtract.bind(5, 3), iterations)
	#time_callable(Big.subtract_new.bind(Big.new(5), Big.new(3)), iterations) # 3.14 times faster
	#endregion
	
	
	#region subtract_new
	#endregion
	
	
	#region times
	#print(Big.times(Big.new(1.2, 1), Big.new(6.8, 1)).to_big_string())
	#print(Big.times_new(Big.new(1.2, 1), Big.new(6.8, 1)).to_big_string())
	#time_callable(Big.times.bind(5, 3), iterations)
	#time_callable(Big.times_new.bind(Big.new(5), Big.new(3)), iterations) # 2.60 times faster
	## Test 1: Small numbers
	#a = Big.new(2, 0)  # 2
	#b = Big.new(3, 0)  # 3
	#print(Big.times_new(a, b).to_float())  # 6.0 ✓
#
	## Test 2: Large mantissa
	#var c = Big.new(9.9, 0)  # 9.9
	#var d = Big.new(9.9, 0)  # 9.9
	#var result = Big.times_new(c, d)
	#print(result.mantissa)    # 9.801 ✓ (98.01 normalized)
	#print(result.exponent)    # 1 ✓
#
	## Test 3: Very large numbers
	#var e = Big.new(5.5, 100)  # 5.5e100
	#var f = Big.new(2.0, 200)  # 2.0e200
	#result = Big.times_new(e, f)
	#print(result.mantissa)    # 1.1 ✓ (11.0 normalized)
	#print(result.exponent)    # 301 ✓
	#endregion
	
	
	#region times_new
	#endregion
	
	
	#region division
	#endregion
	
	
	#region division_new
	#endregion
	
	
	#region powers
	#print("Testing powers")
	#print(Big.powers(Big.new(3.14, 1), 2860).to_big_string())
	#print(Big.powers_new(Big.new(3.14, 1), Big.new(2.86, 3)).to_big_string())
	##compare_powers(Big.powers, Big.powers_new, -100, 0, 0, 100)
	##
	##print(Big.powers(Big.new(5.0, 0), 4).toString())
	##print(Big.powers_new(Big.new(5.0, 0), 4).toString())
	#time_callable(Big.powers_new.bind(Big.new(5.0, 0), Big.new(800, 0)), iterations) # 4.15 faster while being more accurate
	#time_callable(Big.powers.bind(Big.new(5.0, 0), 800), iterations)
	#endregion
	
	
	#region powers_new
	#endregion
	
	
	#region root
	#endregion
	
	
	#region root_new
	#endregion
	
	
	#region modulo
	#endregion
	
	
	#region modulo_new
	#endregion
	
	
	#region round_down
	#endregion
	
	
	#region round_down_new
	#endregion
	
	
	#region min_value
	#endregion
	
	
	#region min_value_new
	#endregion
	
	
	#region plus
	#endregion
	
	
	#region plus_equals
	#endregion
	
	
	#region minus
	#endregion
	
	
	#region minus_equals
	#endregion
	
	
	#region multiply
	#endregion
	
	
	#region multiply_equals
	#endregion
	
	
	#region divide
	#endregion
	
	
	#region divide_equals
	#endregion
	
	
	#region mod
	#endregion
	
	
	#region mod_equals
	#endregion
	
	
	#region power
	#endregion
	
	
	#region power_equals
	#endregion
	
	
	#region square_root
	#endregion
	
	
	#region squared
	#endregion
	
	
	#region is_equal_to
	#endregion
	
	
	#region is_greater_than
	#endregion
	
	
	#region is_greater_than_or_equal_to
	#endregion
	
	
	#region is_less_than
	#endregion
	
	
	#region is_less_than_or_equal_to
	#endregion
	
	
	#region log10
	#endregion
	
	
	#region abs_log10
	#endregion
	
	
	#region ln
	#endregion
	
	
	#region logN
	#endregion
	
	
	#region pow10
	#endregion

	#region to_aa
	#for i in range(200):
		#print(i, " ", Big.new(3.14, i).to_aa())
		#print(i, " ", Big.new(3.14, i).to_aa_new())
		#print(i, " ", Big.new(3.14, i).to_aa_new_2())
		#print("\n")
	#print(Big.new(32.14, 2999).to_aa())
	#print(Big.new(32.14, 2999).to_aa_new())
	#print(Big.new(32.14, 2999).to_aa_new_2())
	#iterations *= 5
	#time_callable(Big.new(32.14, 2999).to_aa, iterations)
	#time_callable(Big.new(32.14, 2999).to_aa_new, iterations)
	#time_callable(Big.new(32.14, 2999).to_aa_new_2, iterations)
	#print(Big.suffixes_aa_new)
	#endregion
	
	#region to_scientific
	var my_float: float = 3
	print("my_float: ", str(my_float).split("."))
	var a: Big = Big.new(3, 10)
	print(a.to_scientific())
	#endregion
	
	# Test static func _size_check(m: float) -> void:
	# mantissa is too big
	#a = Big.new(1209600.001)
	
	
	# Test static func normalize(big: Big) -> void:
	#assert()
	
	#a = Big.new(1_000_999)
	#Big.normalize_new(a)
	#
	#a = Big.new(0.0, 10)
	#
	#Big.normalize(a)
	#print(a.toString())
	
	#
#region normalize()
	# Speed test for normalize()
	#time_callable(Big.normalize.bind(Big.new(1.23, 0)), iterations)
	#time_callable(Big.normalize_new.bind(Big.new(1.23, 0)), iterations)
	#compare_two_bigs(Big.normalize, Big.normalize_new, 1_000_000, 1_000_500, 1_000_000, 1_000_500)
	#
	#compare_big_random(Big.normalize, Big.normalize_new, 100_000)
	#compare_two_bigs(Big.normalize, Big.normalize_new)
#endregion
	
	
	#var mantissa = 1209000.0
	#var exponent = 9223372036854775807
	#var iterations: int = 100000
	#a = Big.new(mantissa, exponent)
	#Big.normalize(a)
	#print(a.toEuropeanName())
	#a = Big.new(mantissa, exponent)
	#Big.normalize_new(a)
	#print(a.toEuropeanName())
	#var start = Time.get_ticks_usec()
	#for i in range(iterations):
		#a = Big.new(mantissa, exponent)
		#Big.normalize(a)
	#
	#print(Time.get_ticks_usec() - start)
	#start = Time.get_ticks_usec()
	#
	#for i in range(iterations):
		#a = Big.new(mantissa, exponent)
		#Big.normalize_new(a)
		#
	#print(Time.get_ticks_usec() - start)
	
	# Test normalize vs normalize_new for equality
	#var b: Big
	#for man in range(1, 100):
		#for expo in range(0, 100):
			#a = Big.new(man, expo)
			#b = Big.new(man, expo)
			#Big.normalize(a)
			#Big.normalize_new(b)
			## TODO: Check all the to*() methothods
			#if a.mantissa != b.mantissa:
				#print(a.toScientific())
				#print(b.toScientific())
				#pass
			#assert(is_equal_approx(a.mantissa, b.mantissa))
			#assert(a.exponent == b.exponent)

	# Test random mantissas and exponents	
	#for i in range(0, 10):
		#var rand_mantissa = randf_range(0, 1209600.0)
		#var rand_exponent = randi_range(0, 9223372036854775807)
		#a = Big.new(rand_mantissa, rand_exponent)
		#Big.normalize(a)
		#print(a.toMetricName())
		#a = Big.new(rand_mantissa, rand_exponent)
		#Big.normalize_new(a)
		#print(a.toMetricName())
		#print("\n")
	
	
	#a = Big.new(236045.23)
	#Big.normalize_new(a)
	#print(a.toScientific())
	
	#a = Big.new(-100.0, 3)
	#print(a.toEuropeanName())
	#Big.normalize_new(a)
	#Big.absolute(a)
	#print(a.toEuropeanName())
	
	#a = Big.new(15, 1)
	#b = Big.new(50, 1)
	#print(Big.times_new(a, b).toEuropeanName())
	
	#print(Big.add_new(Big.powers_new(Big.new(7), 50), Big.new(1)).toScientific())
	
	# Test modulo()
	# 8 mod 5 -> 3
	#print(Big.modulo_new(Big.new(8.0, 0), 5).toString())
	#print(a.toString())
	#print(b.toString())
	#print(Big.powers(a, b).toString())
	#print(Big.powers_new(a, b.mantissa * (10 ** b.exponent)).toString())
	#print("Normalize test when the mantissa is 0")
	#print(Big.new(0.0, 3).toString())
	
	# Test static func round_down_new(x: Big) -> Big:
	#time_callable(Big.round_down.bind(Big.new(1.23, 0)), iterations)
	#time_callable(Big.round_down_new.bind(Big.new(1.23, 0)), iterations)
	#
	#compare_two_bigs(Big.round_down, Big.round_down_new)
	
	
	
	print("All tests passed")

func _on_button_pressed(value: int) -> void:
	test_big.plus(Big.new(value))
	label.text = test_big.to_scientific()


func time_callable(callable: Callable, _iterations: int = 1) -> void:
	var start_time: int = Time.get_ticks_usec()
	for i in range(_iterations):
		callable.call()
		i += 1
	print(Time.get_ticks_usec() - start_time, " " + callable.get_method())



## Checks the mantissa and exponent after running it thorugh two different callables
## to see if it outputs the same value. Raises an error if that's not the case.
func compare_two_bigs(callable_1: Callable, callable_2: Callable,
		_iterations_mantissa_start: int = 0, _iterations_mantissa_end: int = 100,
		_iterations_exponent_start: int = 0, _iterations_exponent_end: int = 100) -> void:
	var temp_1: Big
	var temp_2: Big
	for _mantissa in range(_iterations_mantissa_start, _iterations_mantissa_end):
		for _exponent in range(_iterations_exponent_start, _iterations_exponent_end):
			temp_1 = Big.new(float(_mantissa), _exponent)
			temp_2 = Big.new(float(_mantissa), _exponent)
			callable_1.call(temp_1)
			callable_2.call(temp_2)
			#print("Temp_1.mantissa: ", temp_1.mantissa)
			#print("Temp_2.mantissa: ", temp_2.mantissa)
			#print("Temp_1.exponent: ", temp_1.exponent)
			#print("Temp_2.exponent: ", temp_2.exponent)
			assert(is_equal_approx(temp_1.mantissa, temp_2.mantissa), "%s %s" % [temp_1.mantissa, temp_2.mantissa])
			assert(temp_1.exponent == temp_2.exponent, "%s %s" % [temp_1.exponent, temp_2.exponent])
	print(callable_1.get_method() + " and " + callable_2.get_method() + " returned similar results")


func compare_powers(callable_1: Callable, callable_2: Callable,
		_iterations_mantissa_start: int = 0, _iterations_mantissa_end: int = 100,
		_iterations_exponent_start: int = 0, _iterations_exponent_end: int = 100) -> void:
	var temp_1: Big
	var temp_2: Big
	for _mantissa in range(_iterations_mantissa_start, _iterations_mantissa_end):
		for _exponent in range(_iterations_exponent_start, _iterations_exponent_end):
			temp_1 = Big.new(float(_mantissa), _exponent)
			temp_2 = Big.new(float(_mantissa), _exponent)
			callable_1.call(temp_1, _exponent)
			callable_2.call(temp_2, _exponent)
			#print("Temp_1.mantissa: ", temp_1.mantissa)
			#print("Temp_2.mantissa: ", temp_2.mantissa)
			#print("Temp_1.exponent: ", temp_1.exponent)
			#print("Temp_2.exponent: ", temp_2.exponent)
			assert(is_equal_approx(temp_1.mantissa, temp_2.mantissa), "%s %s" % [temp_1.mantissa, temp_2.mantissa])
			assert(temp_1.exponent == temp_2.exponent, "%s %s" % [temp_1.exponent, temp_2.exponent])
	print(callable_1.get_method() + " and " + callable_2.get_method() + " returned similar results")


## Checks two big functions at random points
func compare_big_random(callable_1: Callable, callable_2: Callable, _iterations: int = 1) -> void:
	var random_mantissa: float
	var random_exponent: int
	var temp_1: Big
	var temp_2: Big
	for i in range(_iterations):
		random_mantissa = randf_range(0, Big.MANTISSA_MAX)
		random_exponent = randi_range(0, 248)
		temp_1 = Big.new(random_mantissa, random_exponent)
		temp_2 = Big.new(random_mantissa, random_exponent)
		callable_1.call(temp_1)
		callable_2.call(temp_2)
		assert(is_equal_approx(temp_1.mantissa, temp_2.mantissa), "%s %s" % [temp_1.mantissa, temp_2.mantissa])
		assert(temp_1.exponent == temp_2.exponent, "%s %s" % [temp_1.exponent, temp_2.exponent])
	print("Checked " + " at " +  str(_iterations) + " iterations." + callable_1.get_method() + " and " + callable_2.get_method() + " returned similar results")
