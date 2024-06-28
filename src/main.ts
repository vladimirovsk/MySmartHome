import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import {Logger} from '@nestjs/common';

const PORT:number = 8000


async function bootstrap() {
  const logger = new Logger('MAIN');

  const app = await NestFactory.create(AppModule, { cors: true });
  app.enableCors();
  await app.listen(PORT, async () => {
    logger.log(`Application is running on: ${await app.getUrl()}`);
  });
}

bootstrap()
