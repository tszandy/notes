from contextlib import contextmanager

@contextmanager
def managed_resource(*args, **kwds):
    resource = acquire_resource(*args,**kwds)
    try: 
        yield resource
    finally:
        release_resource(resource)

>>> with managed_resource(timeout = 3600) as resource:


from contextlib import asynccontextmanager
@asynccontextmanager
async def get_connection():
    conn = await acquire_db_connection()
    try:
        yield conn
    finally:
        await release_db_connection(conn)

async def get_all_users():
    async with get_connection() as conn:
        return conn.query('Select ..')

