#ifndef _H_SHARED_
#define _H_SHARED_

void io_setup(void);
void set_voltage_limit(int);
void set_current_value(int);
int read_current(void);
int read_voltage(void);

#endif
