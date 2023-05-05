import asyncio
import argparse
import yaml


async def print_loop(msg:str, delay:int):
    while True:
        print(msg)
        await asyncio.sleep(delay)

async def run(name:str):
    task1 = asyncio.create_task(print_loop(f"{name}-task1", 10))
    task2 = asyncio.create_task(print_loop(f"{name}-task2", 13))
    await task1
    await task2


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Test project')
    parser.add_argument(
        "--name",
        required=True,
        type=str,
        help="Unique name of service"
    )
    parser.add_argument(
        "--config_file",
        required=False,
        type=str,
        default='worker.db',
        help="Path to worker configuration file (*.yml)"
    )
    args = parser.parse_args()
    name = args.name
    config_file = args.config_file
    cfg = yaml.load(open(config_file, encoding='utf8'), Loader=yaml.SafeLoader)
    print(cfg)
    
    f = open(f"test-{name}.txt", "a")
    f.write("The service is up and running")
    f.close()
    asyncio.run(run(name))