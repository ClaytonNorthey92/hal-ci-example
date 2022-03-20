import re
import subprocess
import sys

if __name__ == '__main__':
    try:
        subprocess.run(['make', 'run-arm', '>', 'test_log.txt'], timeout=5)
    except subprocess.TimeoutExpired as e:
        pass
    with open('test_log.txt') as test_log:
        logs = test_log.read();
        print(logs)
        tests_results = re.search(r'([0-9]*) Tests ([0-9]*) Failures ([0-9]*) Ignored', logs)
        if tests_results is None:
            print('could not find test results line')
            sys.exit(1)
        failures = tests_results.group(2)
        print('found {} failures'.format(failures))
        if (failures == '0'):
            sys.exit(0)
        else:
            sys.exit(1)
