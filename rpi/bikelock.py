import initState
import connect_lock
import io
import threading

buf = io.IO()

def job():
    initState.init_main(buf)

t = threading.Thread(target = job)
t.start()

connect_lock.lock_main(buf)