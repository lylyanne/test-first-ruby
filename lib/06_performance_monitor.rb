def measure(run=1)
	total = 0
	run.times {
		start_time = Time.now
		yield
		total += Time.now-start_time
	}
	total / run
end