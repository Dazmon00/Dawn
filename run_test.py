import asyncio
import os
import random
import time
from typing import Callable, Coroutine, Any, List, Set
from dataclasses import dataclass

# Assuming these modules are available or need to be adjusted for macOS:
from loguru import logger
from loader import config, semaphore, file_operations
from core.bot import Bot
from models import Account
from utils import setup
from console import Console
from database import initialize_database



if __name__ == "__main__":
    print("test")
    time.sleep(random.uniform(4, 7))