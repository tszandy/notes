# Read IFF(interchange file format) chunked data
import chunk

# IFF file structure
Offset : Length : Contents
0      : 4      : Chunk ID
4      : 4      : Size of chunk in big-endian byte order, not including the header
8      : n      : Data bytes, where n is the size given in the preceding field
8 + n  : 0 or 1 : Pad byte needed if n is odd and chunk alignment is used

chunk.getname()

chunk.getsize()

# set the chunk's current position
chunk.seek(pos)

# return the current position into the chunk
chunk.tell()

# Read at most size bytes from the chunk
chunk.read(size)

# skip to the end of chunk
chunk.skip()

