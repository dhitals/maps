Looking at earthquakes with USGS to see what I can learn.

I started with the USGS [libcomcat] (https://github.com/usgs/libcomcat) library: 
and ported the available code to python3. Most of the work was done by
standard python command line tool `2to3 -w example.py`; but I did have
to make a few manual edits. The significant ones were:

- `print` and `raise Exception` are now functions. So add parenthesis.
- `urllib` and `urllib2` have been split in python3.
- In python3, `urllib` does not seem to know how to encode bytes, as
  returned by HTTP, into a string. Use `decode()` to [fix]
  (http://stackoverflow.com/questions/6862770/python-3-let-json-object-accept-bytes-or-let-urlopen-output-strings) it.
   `reply = json.loads(rawreply.decode())`
