import multiprocessing

def producer(queue):
    # Производим данные
    for i in range(10):
        data = f"Hello from a producer! {i}"
        queue.put(data)

def consumer(queue):
    # Потребляем данные
    while True:
        data = queue.get()
        print(data)

if __name__ == "__main__":
    # Создаем queue
    queue = multiprocessing.Queue()

    # Создаем процессы
    producer_process = multiprocessing.Process(target=producer, args=(queue,))
    consumer_process = multiprocessing.Process(target=consumer, args=(queue,))

    # Запускаем процессы
    producer_process.start()
    consumer_process.start()

    # Ждем завершения процессов
    producer_process.join()
    consumer_process.join()