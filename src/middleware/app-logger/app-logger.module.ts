import { Module } from '@nestjs/common';
import { AppLoggerService } from './app-logger.service';
import {ConfigModule} from '@nestjs/config';

@Module({
	imports: [
		ConfigModule
	],
	providers: [
		AppLoggerService
	],
	exports: [
		AppLoggerService
	]
})
export class AppLoggerModule {

}
