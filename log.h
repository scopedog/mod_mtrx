#ifndef	_MY_LOG_H_
#define	_MY_LOG_H_

#include <openssl/ssl.h>

#ifdef __cplusplus
extern "C" {
#endif
void	Fatal(const char*, ...);
void	InitLog(char *, char *, int);
void	Log(const char *, ...);
void	LogSSLError(const char *, SSL *, int);
#ifdef __cplusplus
}
#endif

#endif
