import 'package:equatable/equatable.dart';

import '../product.dart';

abstract class APIState extends Equatable {}


class APIInital extends APIState {
  @override
  List<Object?> get props =>[];
} 

class APILoading extends APIState {

  final String msg  ; 
  APILoading(this.msg) ;
  @override
  List<Object?> get props => [msg];
  } 

class APISuccess extends APIState {

  final List<Product> data;  

  APISuccess(this.data) ; 

  @override
  List<Object?> get props =>  [data];
 }

class APIError extends APIState {


  final String err ; 
  APIError(this.err) ;
  @override
  List<Object?> get props => [err];
 }
 


