/**
* \file memory.h
*
* \brief Memory allocation layer
*
* Copyright (C) 2006-2013, Brainspark B.V.
*
* This file is part of PolarSSL (http://www.polarssl.org)
* Lead Maintainer: Paul Bakker <polarssl_maintainer at polarssl.org>
*
* All rights reserved.
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
#ifndef POLARSSL_MEMORY_H
#define POLARSSL_MEMORY_H

#include "config.h"

#include <stdlib.h>

#if !defined(POLARSSL_CONFIG_OPTIONS)
#define POLARSSL_MEMORY_ALIGN_MULTIPLE 4 /**< Align on multiples of this value */

#define POLARSSL_MEMORY_STDMALLOC malloc /**< Default allocator to use, can be undefined */
#define POLARSSL_MEMORY_STDFREE free /**< Default free to use, can be undefined */
#endif /* POLARSSL_CONFIG_OPTIONS */

#define MEMORY_VERIFY_NONE 0
#define MEMORY_VERIFY_ALLOC (1 << 0)
#define MEMORY_VERIFY_FREE (1 << 1)
#define MEMORY_VERIFY_ALWAYS (MEMORY_VERIFY_ALLOC | MEMORY_VERIFY_FREE)

#ifdef __cplusplus
extern "C" {
#endif

/*
* The function pointers for malloc and free
*/
extern void * (*polarssl_malloc)( size_t len );
extern void (*polarssl_free)( void *ptr );

/**
* \brief Set your own memory implementation function pointers
*
* \param malloc_func the malloc function implementation
* \param free_func the free function implementation
*
* \return 0 if successful
*/
int memory_set_own( void * (*malloc_func)( size_t ),
                    void (*free_func)( void * ) );

#if defined(POLARSSL_MEMORY_BUFFER_ALLOC_C)
/**
* \brief Initialize use of stack-based memory allocator.
* The stack-based allocator does memory management inside the
* presented buffer and does not call malloc() and free().
* It sets the global polarssl_malloc() and polarssl_free() pointers
* to its own functions.
*
* \note This code is not optimized and provides a straight-forward
* implementation of a stack-based memory allocator.
*
* \param buf buffer to use as heap
* \param len size of the buffer
*
* \return 0 if successful
*/
int memory_buffer_alloc_init( unsigned char *buf, size_t len );

/**
* \brief Determine when the allocator should automatically verify the state
* of the entire chain of headers / meta-data.
* (Default: MEMORY_VERIFY_NONE)
*
* \param verify One of MEMORY_VERIFY_NONE, MEMORY_VERIFY_ALLOC,
* MEMORY_VERIFY_FREE or MEMORY_VERIFY_ALWAYS
*/
void memory_buffer_set_verify( int verify );

#if defined(POLARSSL_MEMORY_DEBUG)
/**
* \brief Print out the status of the allocated memory (primarily for use
* after a program should have de-allocated all memory)
* Prints out a list of 'still allocated' blocks and their stack
* trace if POLARSSL_MEMORY_BACKTRACE is defined.
*/
void memory_buffer_alloc_status();
#endif /* POLARSSL_MEMORY_DEBUG */

/**
* \brief Verifies that all headers in the memory buffer are correct
* and contain sane values. Helps debug buffer-overflow errors.
*
* Prints out first failure if POLARSSL_MEMORY_DEBUG is defined.
* Prints out full header information if POLARSSL_MEMORY_DEBUG_HEADERS
* is defined. (Includes stack trace information for each block if
* POLARSSL_MEMORY_BACKTRACE is defined as well).
*
* \returns 0 if verified, 1 otherwise
*/
int memory_buffer_alloc_verify();

#endif /* POLARSSL_MEMORY_BUFFER_ALLOC_C */

#ifdef __cplusplus
}
#endif

#endif /* memory.h */